import 'package:flutter/material.dart';
import 'package:heart_at_time/src/widgets/bar_button_section.dart';
import 'package:heart_at_time/src/widgets/heart_icon.dart';
import 'package:heart_at_time/src/widgets/patient_request_list_item.dart';
import 'package:heart_at_time/src/widgets/request_list_item.dart';

class RequestListScreen extends StatefulWidget {
  const RequestListScreen({super.key});

  @override
  State<RequestListScreen> createState() => _RequestListScreenState();
}

class _RequestListScreenState extends State<RequestListScreen> {
  bool caretake_visible = true;
  bool patient_visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.04),
            decoration: BoxDecoration(
              color: Color(0xffFFF4EA),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        HeartWithIcon(
                          iconName: Icons.person_add,
                          showIcon: true,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.width * 0.07),
                          child: Text(
                            "Solicitudes",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.07),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.15),
                          child: Text("Cuidadores",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.04)),
                        ),
                        BarButtonSection(
                          children: [
                            Container(
                              child: caretake_visible
                                  ? ExpansionTile(
                                      title: Text(
                                        "Jared Zaragoza",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05),
                                      ),
                                      children: <Widget>[
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                caretake_visible = false;
                                              });
                                            },
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Color(0xff3EBDC6)),
                                                fixedSize:
                                                    MaterialStatePropertyAll(Size(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05)),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(10.0),
                                                        side: BorderSide(color: Color.fromARGB(255, 2, 134, 143), width: 1)))),
                                            child: Text(
                                              "Aceptar",
                                              style: TextStyle(
                                                  color: Color(0xffFFF4EA),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.04,
                                                  fontWeight: FontWeight.w100),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                caretake_visible = false;
                                              });
                                            },
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Color(0xffFDA5A0)),
                                                fixedSize:
                                                    MaterialStatePropertyAll(Size(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05)),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(10.0),
                                                        side: BorderSide(color: Color.fromARGB(255, 255, 113, 105), width: 1)))),
                                            child: Text(
                                              "Rechazar",
                                              style: TextStyle(
                                                  color: Color(0xffFFF4EA),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.04,
                                                  fontWeight: FontWeight.w100),
                                            )),
                                      ],
                                      shape: Border(),
                                    )
                                  : Text(""),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.15),
                          child: Text("Pacientes",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.04)),
                        ),
                        BarButtonSection(
                          children: [
                            Container(
                              child: patient_visible == true
                                  ? ExpansionTile(
                                      title: Text(
                                        "Cesar Ramos",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05),
                                      ),
                                      children: <Widget>[
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                patient_visible = false;
                                              });
                                            },
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Color(0xffFDA5A0)),
                                                fixedSize:
                                                    MaterialStatePropertyAll(Size(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.45,
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05)),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(10.0),
                                                        side: BorderSide(color: Color.fromARGB(255, 255, 113, 105), width: 1)))),
                                            child: Text(
                                              "Cancelar Solicitud",
                                              style: TextStyle(
                                                  color: Color(0xffFFF4EA),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.04,
                                                  fontWeight: FontWeight.w100),
                                            )),
                                      ],
                                      shape: Border(),
                                    )
                                  : Text(""),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
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
                    shape: MaterialStatePropertyAll(CircleBorder())),
              ))
        ],
      ),
    );
  }
}
