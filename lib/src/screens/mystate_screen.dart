import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heart_at_time/src/widgets/graph.dart';
import 'package:heart_at_time/src/widgets/heartRateMeter.dart';
import 'package:heart_at_time/src/widgets/infoCard.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

/// [MyStateScreen] es una pantalla que muestra el estado actual del usuario,
/// incluyendo la frecuencia cardíaca medida a través de un dispositivo Bluetooth
/// y guardando estos datos en Firebase Firestore.
class MyStateScreen extends StatefulWidget {
  const MyStateScreen({super.key});

  @override
  State<MyStateScreen> createState() => _MyStateScreenState();
}

class _MyStateScreenState extends State<MyStateScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  BluetoothConnection? connection;
  int _bpm = 0;
  bool isConnecting = true;

  @override
  void initState() {
    super.initState();
    connectToDevice();
  }

  @override
  void dispose() {
    connection?.dispose();
    super.dispose();
  }

  /// Intenta conectar a un dispositivo Bluetooth específico.
  /// La dirección del dispositivo debe ser reemplazada por la dirección de tu dispositivo en esta version del proyecto, posteriormente se modificara para que trabaje con el nombre del dispositivo.
  void connectToDevice() async {
    try {
      BluetoothConnection newConnection = await BluetoothConnection.toAddress('08:B6:1F:34:DD:BE');
      setState(() {
        connection = newConnection;
        isConnecting = false;
      });
      // Escucha los datos entrantes desde el dispositivo Bluetooth.
      newConnection.input!.listen((data) {
        String dataString = String.fromCharCodes(data).trim();
        if (dataString.startsWith("BPM:")) {
          int bpm = int.parse(dataString.split(":")[1].trim());
          setState(() {
            _bpm = bpm;
          });
        // Guarda el BPM en Firestore.
          _saveDataToFirebase(bpm);
        }
      }).onDone(() {
        setState(() {
          isConnecting = true;
        });
      });
    } catch (e) {
      print('Error connecting to device: $e');
    }
  }

  /// Guarda los datos de BPM en Firebase Firestore.
  Future<void> _saveDataToFirebase(int bpm) async {
    try {
      await _firestore.collection('usuarios').doc('7hCw9Yjrdv0Rbw1yF2zs').update({
        'historialBPM': FieldValue.arrayUnion([{
          'bpm': bpm,
          'timestamp': Timestamp.now(),
        }])
      });
    } catch (e) {
      print('Error saving data to Firebase: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                HeartRateMeter(
                  bpm: _bpm,//Muestra el BPM actual
                ),
                const HeartLine(), //Muestra un grafico de la frecuencia cardiaca
                const InfoCard(
                  title: "Resumen",
                  info: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                      "Duis lobortis leo aliquam convallis mollis. Phasellus tempor, "
                      "neque sed viverra cursus, nulla nisl sodales ante, eu eleifend "
                      "ex massa vel nulla. Sed iaculis enim quam, eu lacinia massa "
                      "aliquet vel. Ut eget euismod enim. Cras et purus quam. In "
                      "bibendum tortor eu risus pretium, a gravida mi pellentesque. "
                      "Etiam consectetur ac erat nec posuere. Nunc dictum quam vel eros "
                      "facilisis, ut finibus felis accumsan. Phasellus ultricies sodales "
                      "ipsum vitae molestie.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
