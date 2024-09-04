import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heart_at_time/src/screens/history_screen.dart';
import 'package:heart_at_time/src/screens/listview_screen.dart';
import 'package:heart_at_time/src/screens/mystate_screen.dart';
import 'package:heart_at_time/src/screens/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BluetoothConnection? _connection;
  bool isLoading = false;
  int _currentIndex = 0;
  String message = '';

  Future<void> _connectToDevice() async {
    setState(() {
      isLoading = true;
    });
    final List<BluetoothDevice> devices =
        await FlutterBluetoothSerial.instance.getBondedDevices();
    final BluetoothDevice device =
        devices.firstWhere((e) => e.name == "ESP32test");
    final BluetoothConnection connection =
        await BluetoothConnection.toAddress(device.address);
    setState(() {
      _connection = connection;
      isLoading = false;
    });
  }

  Future<void> _disconnectFromDevice() async {
    await _connection!.finish();
    setState(() {
      _connection = null;
    });
  }

  Future<void> _sendData(int value) async {
    if (_connection != null) {
      _connection!.input?.listen((Uint8List data) {
        String dataStr = ascii.decode(data);
        message += dataStr;
        if (dataStr.contains('\n')) {
          _processData(
              message.trim()); // Process and upload the complete message
          message = ''; // Clear buffer to accept new string
        }
      });
      await _connection!.output.allSent;
    }
  }

  void _processData(String data) {
    // Assuming data format is like: "78,16 de mayo de 2024, 12:47:43 p.m. UTC-7"
    List<String> parts = data.split(',');
    if (parts.length == 3) {
      int bpm = int.parse(parts[0]);
      String estado = bpm > 0 ? 'true' : 'false';
      String tiempo = parts[2];

      Map<String, dynamic> bpmData = {
        'bpm': bpm,
        'estado': estado == 'true',
        'tiempo': tiempo,
      };

      _uploadData(bpmData);
    }
  }

  Future<void> _uploadData(Map<String, dynamic> data) async {
    String userId = "exampleUserId"; // Replace with actual user ID
    CollectionReference users =
        FirebaseFirestore.instance.collection('usuarios');

    try {
      DocumentReference userDoc = users.doc(userId);
      DocumentSnapshot userSnapshot = await userDoc.get();

      if (userSnapshot.exists) {
        // Update existing user document
        userDoc.update({
          'historialBPM': FieldValue.arrayUnion([data])
        });
      } else {
        // Create new user document if it doesn't exist
        userDoc.set({
          'historialBPM': [data]
        });
      }
    } catch (e) {
      print('Error uploading data: $e');
    }
  }

  List<Widget> screens = [
    MyStateScreen(),
    ListViewScreen(),
    HistoryScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF4EA),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) => {
          setState(() {
            _currentIndex = index;
          })
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Mi Estado"),
          BottomNavigationBarItem(
              icon: Icon(Icons.monitor_heart_outlined), label: "A Distancia"),
          BottomNavigationBarItem(
              icon: Icon(Icons.history_toggle_off_sharp), label: "Historial"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_3_outlined), label: "Perfil"),
        ],
        backgroundColor: Color(0xff3EBDC6),
        selectedItemColor: Color(0xffFFF4EA),
        unselectedItemColor: Color(0xffFFF4EA),
        selectedLabelStyle: GoogleFonts.oxygen(),
        unselectedLabelStyle: GoogleFonts.oxygen(),
        type: BottomNavigationBarType.fixed,
        iconSize: 32,
      ),
    );
  }
}
