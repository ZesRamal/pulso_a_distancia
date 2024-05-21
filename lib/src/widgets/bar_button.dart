import 'package:flutter/material.dart';

class OptionBarButton extends StatelessWidget {
  final String text;
  final Widget pushTo;
  const OptionBarButton({
    super.key,
    required this.text,
    required this.pushTo,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pushTo),
        );
      },
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          fixedSize: Size(MediaQuery.of(context).size.width * 0.8,
              MediaQuery.of(context).size.width * 0.03),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashFactory: NoSplash.splashFactory),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
          Text(
            ">",
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
