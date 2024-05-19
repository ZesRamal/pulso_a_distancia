import 'package:flutter/material.dart';
import 'package:heart_at_time/src/widgets/heart_icon.dart';
import 'package:heart_at_time/src/widgets/user_card.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  final items = [];
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
                decoration: BoxDecoration(
                  color: Color(0xffFFF4EA),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Positioned(
                              top: MediaQuery.of(context).size.width * 0.2,
                              left: MediaQuery.of(context).size.width * 0.15,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 1,
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Color(0xff0096D1)))),
                              ),
                            ),
                            Row(
                              children: [
                                HeartWithIcon(
                                  iconName: Icons.abc,
                                  showIcon: false,
                                ),
                                HeartWithIcon(
                                  iconName: Icons.abc,
                                  showIcon: false,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    DistanceUserCard(),
                    DistanceUserCard(),
                    DistanceUserCard(),
                    DistanceUserCard(),
                    DistanceUserCard(),
                    DistanceUserCard(),
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
                  onPressed: () {},
                  child: Icon(
                    Icons.add,
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
}
