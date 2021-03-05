import 'package:flutter/material.dart';

class Relleno extends StatelessWidget {
  final relleno;

  Relleno(this.relleno);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: relleno,
    );
  }
}
