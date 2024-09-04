import 'package:flutter/material.dart';
import 'package:heart_at_time/src/widgets/heart_icon.dart';
import 'package:heart_at_time/src/widgets/list_item.dart';
import 'package:heart_at_time/src/widgets/list_section.dart';

class PatientsListScreen extends StatefulWidget {
  const PatientsListScreen({super.key});

  @override
  State<PatientsListScreen> createState() => _PatientsListScreenState();
}

class _PatientsListScreenState extends State<PatientsListScreen> {
  bool visible = true;
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
                          iconName: Icons.list,
                          showIcon: true,
                        ),
                        Text(
                          "Pacientes",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.07),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.04),
                      child: ListSection(
                        children: [patient(context)],
                      ),
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

  Container patient(BuildContext context) {
    return Container(
      child: visible
          ? ExpansionTile(
              title: Text(
                "Ricardo Escobar",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05),
              ),
              shape: Border(),
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      setState(() {
                        visible = false;
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xffFDA5A0)),
                        fixedSize: MaterialStatePropertyAll(Size(
                            MediaQuery.of(context).size.width * 0.3,
                            MediaQuery.of(context).size.height * 0.05)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 113, 105),
                                        width: 1)))),
                    child: Text(
                      "Eliminar",
                      style: TextStyle(
                          color: Color(0xffFFF4EA),
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.w100),
                    )),
              ],
            )
          : Text(""),
    );
  }
}
