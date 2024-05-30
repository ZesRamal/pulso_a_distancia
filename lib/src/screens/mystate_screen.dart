import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heart_at_time/src/providers/hear_rate_provider.dart';
import 'package:heart_at_time/src/screens/features/models/user_model.dart';
import 'package:heart_at_time/src/widgets/graph.dart';
import 'package:heart_at_time/src/widgets/heartRateMeter.dart';
import 'package:heart_at_time/src/widgets/infoCard.dart';
import 'package:provider/provider.dart';

class MyStateScreen extends StatefulWidget {
  const MyStateScreen({super.key});

  @override
  State<MyStateScreen> createState() => _MyStateScreenState();
}

class _MyStateScreenState extends State<MyStateScreen> {
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
                vertical: MediaQuery.of(context).size.height * 0.1),
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
                      return HeartRateMeter(
                        bpm: last_bpm,
                      );
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    if (!snapshot.hasData || snapshot.data == null) {
                      return Text('No data available');
                    }

                    Usuario usuario = snapshot.data!;
                    var latestRecord = usuario.historialBPM.last;
                    var history = usuario.historialBPM.getRange(
                        usuario.historialBPM.length - 30,
                        usuario.historialBPM.length);
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
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis lobortis leo aliquam convallis mollis. Phasellus tempor, neque sed viverra cursus, nulla nisl sodales ante, eu eleifend ex massa vel nulla. Sed iaculis enim quam, eu lacinia massa aliquet vel. Ut eget euismod enim. Cras et purus quam. In bibendum tortor eu risus pretium, a gravida mi pellentesque. Etiam consectetur ac erat nec posuere. Nunc dictum quam vel eros facilisis, ut finibus felis accumsan. Phasellus ultricies sodales ipsum vitae molestie.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
