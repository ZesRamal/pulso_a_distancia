import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:heart_at_time/src/widgets/heart_icon.dart';
import 'package:heart_at_time/src/widgets/list_section.dart';

class DeviceStatusScreen extends StatefulWidget {
  const DeviceStatusScreen({Key? key}) : super(key: key);

  @override
  _DeviceStatusScreenState createState() => _DeviceStatusScreenState();
}

class _DeviceStatusScreenState extends State<DeviceStatusScreen> {
  BluetoothConnection? _connection;
  bool _isConnecting = false;
  String _status = "Scanning for devices...";

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  void _requestPermissions() async {
    var statuses = await [
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.location,
    ].request();

    if (statuses[Permission.bluetoothScan]!.isGranted &&
        statuses[Permission.bluetoothConnect]!.isGranted &&
        statuses[Permission.location]!.isGranted) {
      _scanForDevices();
    } else {
      setState(() {
        _status = "Permissions not granted";
      });
    }
  }

  void _scanForDevices() {
    setState(() {
      _status = "Scanning for devices...";
    });

    FlutterBluetoothSerial.instance.startDiscovery().listen((r) async {
      if (r.device.name == 'ESP32S') {
        FlutterBluetoothSerial.instance.cancelDiscovery();
        _connectToDevice(r.device);
      }
    });
  }

  void _connectToDevice(BluetoothDevice device) async {
    setState(() {
      _status = "Connecting to device...";
      _isConnecting = true;
    });

    try {
      BluetoothConnection connection = await BluetoothConnection.toAddress(device.address);
      setState(() {
        _connection = connection;
        _status = "Connected";
        _isConnecting = false;
      });
    } catch (e) {
      print('Error connecting to device: $e');
      setState(() {
        _status = "Error connecting to device";
        _isConnecting = false;
      });
    }
  }

  void _disconnectDevice() {
    _connection?.close();
    setState(() {
      _connection = null;
      _status = "Disconnected";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.03,
            ),
            decoration: BoxDecoration(
              color: Color(0xffFFF4EA),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    HeartWithIcon(
                      iconName: Icons.bluetooth,
                      showIcon: true,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.04,
                      ),
                      child: ListSection(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.favorite_border_outlined,
                                  color: Color(0xff0096D1),
                                  size: MediaQuery.of(context).size.width * 0.2,
                                ),
                                Text(
                                  _connection != null ? "Connected" : "Disconnected",
                                  style: TextStyle(
                                    color: Color(0xff0096D1),
                                    fontSize: MediaQuery.of(context).size.width * 0.08,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _status,
                                    style: TextStyle(fontSize: 16, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: _connection != null ? _disconnectDevice : _scanForDevices,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xffFDA5A0)),
                    fixedSize: MaterialStateProperty.all(Size(
                      MediaQuery.of(context).size.width * 0.7,
                      MediaQuery.of(context).size.height * 0.07,
                    )),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Color.fromARGB(255, 255, 113, 105),
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                  child: Text(
                    _connection != null ? "Disconnect Device" : "Connect Device",
                    style: TextStyle(
                      color: Color(0xffFFF4EA),
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.02,
            top: MediaQuery.of(context).size.width * 0.07,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Color(0xff0096D1),
                size: MediaQuery.of(context).size.width * 0.14,
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(CircleBorder()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
