import 'package:flutter/material.dart';
import 'package:heart_at_time/src/widgets/history_graph.dart';
import 'package:heart_at_time/src/widgets/heart_icon.dart';
import 'package:heart_at_time/src/widgets/infoCard.dart';
import 'package:heart_at_time/src/widgets/patient_history_graph.dart';
import 'package:heart_at_time/src/widgets/time_selector.dart';
import 'package:heart_at_time/src/providers/hear_rate_provider.dart';
import 'package:provider/provider.dart';

class PatientHistoryScreen extends StatefulWidget {
  const PatientHistoryScreen({super.key});

  @override
  State<PatientHistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<PatientHistoryScreen> {
  TextEditingController _dateController = TextEditingController();
  int _index = 0;
  int day = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;
  int days = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02),
                decoration: BoxDecoration(
                  color: Color(0xffFFF4EA),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HeartWithIcon(
                      iconName: Icons.access_time_sharp,
                      showIcon: true,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                          vertical: MediaQuery.of(context).size.width * 0.05),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          color: Color(0xff3EBDC6)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: _index == 0
                                  ? Color(0xff0096D1)
                                  : Color(0xff3EBDC6),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    _index = 0;
                                    days = 1;
                                  });
                                },
                                child: Text("Hoy",
                                    style: TextStyle(
                                      color: Color(0xffFFF4EA),
                                    ))),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: _index == 1
                                  ? Color(0xff0096D1)
                                  : Color(0xff3EBDC6),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    _index = 1;
                                    days = 7;
                                  });
                                },
                                child: Text("Semana",
                                    style: TextStyle(
                                      color: Color(0xffFFF4EA),
                                    ))),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: _index == 2
                                  ? Color(0xff0096D1)
                                  : Color(0xff3EBDC6),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    _index = 2;
                                    days = 30;
                                  });
                                },
                                child: Text("Mes",
                                    style: TextStyle(
                                      color: Color(0xffFFF4EA),
                                    ))),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: _index == 3
                                  ? Color(0xff0096D1)
                                  : Color(0xff3EBDC6),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    _index = 3;
                                    days = 365;
                                  });
                                },
                                child: Text("Año",
                                    style: TextStyle(
                                      color: Color(0xffFFF4EA),
                                    ))),
                          ),
                        ],
                      ),
                    ),
                    PatientHistoryChart(day: days),
                    InfoCard(
                      title: "Resumen",
                      info:
                          "Se explica brevemente al usuario su estado según estado en la fecha consultada.",
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: MediaQuery.of(context).size.width * 0.05,
              bottom: MediaQuery.of(context).size.width * 0.05,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff3EBDC6),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ]),
                child: TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text("Buscar fecha"),
                              content: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Fecha:"),
                                    TextField(
                                      controller: _dateController,
                                      decoration: InputDecoration(
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        labelText: "AAAA/MM/DD",
                                        filled: true,
                                        prefixIcon: Icon(Icons.calendar_today),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff3EBDC6))),
                                      ),
                                      readOnly: true,
                                      onTap: () {
                                        _selectDate();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Cancelar",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Aceptar",
                                      style: TextStyle(color: Colors.black),
                                    ))
                              ],
                            ));
                  },
                  child: Icon(
                    Icons.calendar_month_outlined,
                    color: Color(0xffFFF4EA),
                    size: MediaQuery.of(context).size.width * 0.15,
                  ),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(CircleBorder())),
                ),
              ))
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        initialDate: DateTime.now());

    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}
