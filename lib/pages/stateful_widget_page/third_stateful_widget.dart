import 'package:flutter/material.dart';

class ThirdStatefulWidget extends StatefulWidget {
  final int number;

  const ThirdStatefulWidget({required this.number});

  @override
  _ThirdStatefulWidgetState createState() => _ThirdStatefulWidgetState();
}

class _ThirdStatefulWidgetState extends State<ThirdStatefulWidget> {

  late final int number;

  @override
  void initState() {
    super.initState();
    number = widget.number;
  }
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: const Color(0xFFCA6117),
        child: Column(
          mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container( height: 80, child: Center(child: Text('To jest trzeci zagnieżdżony StatefulWidget'))),
            Text('Number: $number')
          ],
        ),
      ),
    );
  }
}
