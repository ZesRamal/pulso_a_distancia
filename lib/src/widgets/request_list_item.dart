import 'package:flutter/material.dart';

class RequestListItem extends StatelessWidget {
  const RequestListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        "John Smith",
        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
      ),
      children: <Widget>[
        TextButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xff3EBDC6)),
                fixedSize: MaterialStatePropertyAll(Size(
                    MediaQuery.of(context).size.width * 0.3,
                    MediaQuery.of(context).size.height * 0.05)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                            color: Color.fromARGB(255, 2, 134, 143),
                            width: 1)))),
            child: Text(
              "Aceptar",
              style: TextStyle(
                  color: Color(0xffFFF4EA),
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.w100),
            )),
        TextButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xffFDA5A0)),
                fixedSize: MaterialStatePropertyAll(Size(
                    MediaQuery.of(context).size.width * 0.3,
                    MediaQuery.of(context).size.height * 0.05)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                            color: Color.fromARGB(255, 255, 113, 105),
                            width: 1)))),
            child: Text(
              "Rechazar",
              style: TextStyle(
                  color: Color(0xffFFF4EA),
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.w100),
            )),
      ],
      shape: Border(),
    );
  }
}
