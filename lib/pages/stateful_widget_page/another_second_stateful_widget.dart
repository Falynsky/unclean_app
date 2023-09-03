import 'package:flutter/material.dart';
import 'package:unclean_app/pages/stateful_widget_page/third_stateful_widget.dart';

class AnotherSecondStatefulWidget extends StatefulWidget {


  const AnotherSecondStatefulWidget();

  @override
  State<AnotherSecondStatefulWidget> createState() => _AnotherSecondStatefulWidgetState();
}

class _AnotherSecondStatefulWidgetState extends State<AnotherSecondStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: const Color(0xFFAA1177),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(height: 80, child: Center(child: Text('To jest inny drugi zagnieżdżony StatefulWidget'))),
          ],
        ),
      ),
    );
  }
}
