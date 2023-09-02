import 'package:flutter/material.dart';
import 'package:unclean_app/pages/stateful_widget_page/second_stateful_widget.dart';

class FirstStatefulWidget extends StatefulWidget {
  @override
  _FirstStatefulWidgetState createState() => _FirstStatefulWidgetState();
}

class _FirstStatefulWidgetState extends State<FirstStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: const Color(0xFF6711AA),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(height: 80, child: Center(child: Text('To jest pierwszy zagnieżdżony StatefulWidget'))),
            SecondStatefulWidget()
          ],
        ),
      ),
    );
  }
}
