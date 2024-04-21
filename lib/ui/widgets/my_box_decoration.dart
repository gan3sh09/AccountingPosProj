import 'package:accounting_pos_project/theme/colors.dart';
import 'package:flutter/material.dart';

BoxDecoration myBoxDecorationTopBorder() {
  return const BoxDecoration(
    border: Border(
      top: BorderSide(
        //                    <--- top side
        color: Colors.blueGrey,
        width: 3.0,
      ),
    ),
  );
}

BoxDecoration myBoxDecorationBottomBorder() {
  return const BoxDecoration(
    // border: Border(
    //   bottom: BorderSide(
    //     color: Colors.blueGrey,
    //     width: 3.0,
    //   ),
    // ),
    color: tassistBgLightPurple,
    shape: BoxShape.rectangle,
  );
}
