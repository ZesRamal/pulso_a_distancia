import 'package:flutter/material.dart';
import 'package:heart_at_time/src/widgets/graph.dart';
import 'package:heart_at_time/src/widgets/heartRateMeter.dart';
import 'package:heart_at_time/src/widgets/infoCard.dart';

class MyStateScreen extends StatefulWidget {
  const MyStateScreen({super.key});

  @override
  State<MyStateScreen> createState() => _MyStateScreenState();
}

class _MyStateScreenState extends State<MyStateScreen> {
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
                HeartRateMeter(),
                HeartLine(),
                InfoCard(
                  title: "Resumen",
                  info:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis lobortis leo aliquam convallis mollis. Phasellus tempor, neque sed viverra cursus, nulla nisl sodales ante, eu eleifend ex massa vel nulla. Sed iaculis enim quam, eu lacinia massa aliquet vel. Ut eget euismod enim. Cras et purus quam. In bibendum tortor eu risus pretium, a gravida mi pellentesque. Etiam consectetur ac erat nec posuere. Nunc dictum quam vel eros facilisis, ut finibus felis accumsan. Phasellus ultricies sodales ipsum vitae molestie.",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
