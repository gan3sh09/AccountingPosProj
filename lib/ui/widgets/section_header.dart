import 'package:accounting_pos_project/theme/colors.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({required this.sectionText, super.key});

  final String sectionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: tassistBgLightPurple,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                sectionText,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: tassistPrimary,
                    fontSize: 20),
              ),
            ],
          ),
          const Row(
            children: <Widget>[
              // Icon(
              //   Icons.favorite,
              //   color: TassistPrimaryBackground,
              // ),
              // Icon(
              //   Icons.bookmark,
              //   color: TassistPrimaryBackground,
              // ),
              // IconButton(
              //   icon: Icon(Icons.share),
              //   color: TassistPrimaryBackground,
              //   onPressed: () => ScreenshotShare.takeScreenshotAndShare(),
          
              //   // () => showDialog(
              //   //   context: context,
              //   //   builder: (context) {
              //   //    return AlertDialog(
              //   //         title: Text('Coming soon!'),
              //   //         actions:
              //   //         <Widget>[
              //   //           FlatButton(onPressed: () => Navigator.of(context).pop(), child: Text('Ill wait :)'))
              //   //         ]
              //   //     );
              //   //   },
          
              //   // ),
          
              // ),
            ],
          ),
        ],
      ),
    );
  }
}