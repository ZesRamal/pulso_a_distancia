import 'package:flutter/material.dart';
import 'package:heart_at_time/src/widgets/heart_icon.dart';
import 'package:heart_at_time/src/widgets/list_section.dart';

class DeviceStatusScreen extends StatefulWidget {
  const DeviceStatusScreen({super.key});

  @override
  State<DeviceStatusScreen> createState() => _DeviceStatusScreenState();
}

class _DeviceStatusScreenState extends State<DeviceStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.03),
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
                          top: MediaQuery.of(context).size.width * 0.04),
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
                                  "Conectado",
                                  style: TextStyle(
                                    color: Color(0xff0096D1),
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.08,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xffFDA5A0)),
                        fixedSize: MaterialStatePropertyAll(Size(
                            MediaQuery.of(context).size.width * 0.7,
                            MediaQuery.of(context).size.height * 0.07)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 113, 105),
                                        width: 3)))),
                    child: Text(
                      "Desconectar Banda",
                      style: TextStyle(
                          color: Color(0xffFFF4EA),
                          fontSize: MediaQuery.of(context).size.width * 0.06,
                          fontWeight: FontWeight.w100),
                    ))
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
                    shape: MaterialStatePropertyAll(CircleBorder())),
              ))
        ],
      ),
    );
  }
}
