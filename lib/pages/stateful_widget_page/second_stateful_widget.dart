import 'package:flutter/material.dart';

class SecondStatefulWidget extends StatefulWidget {
  @override
  _SecondStatefulWidgetState createState() => _SecondStatefulWidgetState();
}

class _SecondStatefulWidgetState extends State<SecondStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: const Color(0xFFAA1177),
        child: Column(
          mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container( height: 80, child: Center(child: Text('To jest drugi zagnieżdżony StatefulWidget'))),
          ],
        ),
      ),
    );
  }
}
