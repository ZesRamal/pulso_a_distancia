import 'package:flutter/material.dart';
import 'package:heart_at_time/src/widgets/graph2.dart';
import 'package:heart_at_time/src/widgets/heart_icon.dart';
import 'package:heart_at_time/src/widgets/history_graph.dart';
import 'package:heart_at_time/src/widgets/infoCard.dart';
import 'package:heart_at_time/src/widgets/selector.dart';


/// [HistoryScreen] es una pantalla que muestra el historial de datos del usuario.
/// Esta pantalla incluye un selector de fechas, un gráfico del historial y una tarjeta de información.
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  /// Controlador para el campo de texto de la fecha.
  TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.1),
                decoration: const BoxDecoration(
                  color: Color(0xffFFF4EA),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Encabezado con ícono y título
                    const HeartWithIcon(
                      iconName: Icons.access_time_sharp,
                      showIcon: true,
                    ),
                    // Selector de fechas
                    const Selector(),
                    // Información de PPM y fecha
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.03),
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "-- - -- PPM",
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "DD/MM/AAAA",
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                    ),
                    // Grafico del historial
                    const HistoryChart(),
                    // Tarjeta de informacion
                    const InfoCard(
                      title: "Resumen",
                      info:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis lobortis leo aliquam convallis mollis. Phasellus tempor, neque sed viverra cursus, nulla nisl sodales ante, eu eleifend ex massa vel nulla. Sed iaculis enim quam, eu lacinia massa aliquet vel. Ut eget euismod enim. Cras et purus quam. In bibendum tortor eu risus pretium, a gravida mi pellentesque. Etiam consectetur ac erat nec posuere. Nunc dictum quam vel eros facilisis, ut finibus felis accumsan. Phasellus ultricies sodales ipsum vitae molestie.",
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Botón flotante para seleccionar la fecha
          Positioned(
              right: MediaQuery.of(context).size.width * 0.05,
              bottom: MediaQuery.of(context).size.width * 0.05,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xff3EBDC6),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 0), // changes position of shadow
                      ),
                    ]),
                child: TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text("Buscar fecha"),
                              content: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Fecha:"),
                                    TextField(
                                      controller: _dateController,
                                      decoration: const InputDecoration(
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
                                    child: const Text(
                                      "Cancelar",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Aceptar",
                                      style: TextStyle(color: Colors.black),
                                    ))
                              ],
                            ));
                  },
                  style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(CircleBorder())),
                  child: Icon(
                    Icons.calendar_month_outlined,
                    color: Color(0xffFFF4EA),
                    size: MediaQuery.of(context).size.width * 0.15,
                  ),
                ),
              ))
        ],
      ),
    );
  }
  
  /// Método para seleccionar una fecha usando el [showDatePicker].
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
