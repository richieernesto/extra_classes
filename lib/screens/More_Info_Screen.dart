

import 'package:flutter/material.dart';

class MoreInfoScreen extends StatefulWidget {
  final AssetImage image;
  MoreInfoScreen({required this.image});

  @override
  State<MoreInfoScreen> createState() => _MoreInfoScreenState();
}

class _MoreInfoScreenState extends State<MoreInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 6.0,
                )
              ]),
          child: ClipRRect(borderRadius: BorderRadius.circular(30.0),
          child: Image(image: AssetImage(widget.image.assetName),
          fit: BoxFit.cover,
            ),
          ),
        )
      ]),
    );
  }
}
