// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          ordivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'OR Sign up With',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
          ordivider(),
        ],
      ),
    );
  }

  Expanded ordivider() {
    return Expanded(
        child: Divider(
      color: Colors.black12,
      thickness: 2,
      height: 1.5,
    ));
  }
}
