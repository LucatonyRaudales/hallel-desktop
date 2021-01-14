import 'package:flutter/material.dart';

class IdleDots extends StatelessWidget {
  final Color color;
  IdleDots({this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    final dots = List.generate(5, (_) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color.fromRGBO(22, 29, 55, 1)),
          height: 10,
          width: 10,
        ),
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: dots,
    );
  }
}
