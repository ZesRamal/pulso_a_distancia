import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heart_at_time/src/providers/hear_rate_provider.dart';
import 'package:heart_at_time/src/screens/features/models/user_model.dart';
import 'package:heart_at_time/src/widgets/graph.dart';
import 'package:heart_at_time/src/widgets/heartRateMeter.dart';
import 'package:heart_at_time/src/widgets/infoCard.dart';
import 'package:provider/provider.dart';

class PatientStateScreen extends StatefulWidget {
  const PatientStateScreen({super.key});

  @override
  State<PatientStateScreen> createState() => _PatientStateScreenState();
}

class _PatientStateScreenState extends State<PatientStateScreen> {
  int last_bpm = 0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Usuario?> _fetchUsuario(String userId) async {
    DocumentSnapshot docSnapshot =
        await _firestore.collection('usuarios').doc(userId).get();
    if (docSnapshot.exists) {
      return Usuario.fromFirestore(docSnapshot);
    }
    return null;
  }

  Timer? timer;

  void initTimer() {
    if (timer != null && timer!.isActive) return;

    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      // dos :)
      //job
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.048),
            decoration: BoxDecoration(
              color: Color(0xffFFF4EA),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FutureBuilder<Usuario?>(
                  future: _fetchUsuario(
                      '7hCw9Yjrdv0Rbw1yF2zs'), // Aquí puedes pasar el ID de usuario deseado
                  builder: (context, snapshot) {
                    initTimer();
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return HeartRateMeter(bpm: last_bpm);
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    if (!snapshot.hasData || snapshot.data == null) {
                      return HeartRateMeter(
                        bpm: 0,
                      );
                    }

                    Usuario usuario = snapshot.data!;
                    var latestRecord = usuario.historialBPM.last;
                    var history = usuario.historialBPM;
                    context.read<HeartRateProvider>().setHistory(history);
                    int bpm = latestRecord['bpm'];
                    last_bpm = bpm;
                    List last10 = history
                        .where((map) => map.containsKey('bpm'))
                        .map((map) => map['bpm'])
                        .toList();
                    List last10Times = history
                        .where((map) => map.containsKey('timestamp'))
                        .map((map) => map['timestamp'])
                        .toList();
                    context.read<HeartRateProvider>().setHeartRate(bpm);
                    context.read<HeartRateProvider>().addToHistory(last10);
                    context
                        .read<HeartRateProvider>()
                        .addToHistoryTimes(last10Times);

                    return HeartRateMeter(
                      bpm: bpm,
                    );
                  },
                ),
                HeartLine(),
                InfoCard(
                  title: "Resumen",
                  info:
                      "En este apartado se explica al usuario de manera concisa su estado según las últimas lecturas.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
