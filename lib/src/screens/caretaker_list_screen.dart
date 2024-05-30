import 'package:flutter/material.dart';
import 'package:heart_at_time/src/widgets/heart_icon.dart';
import 'package:heart_at_time/src/widgets/list_item.dart';
import 'package:heart_at_time/src/widgets/list_section.dart';

class CaretakersListScreen extends StatefulWidget {
  const CaretakersListScreen({super.key});

  @override
  State<CaretakersListScreen> createState() => _CaretakersListScreenState();
}

class _CaretakersListScreenState extends State<CaretakersListScreen> {
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
                          "Cuidadores",
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
                        children: [
                          ListItem(
                            name: "Gildegar Pasillas",
                          ),
                        ],
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
}
