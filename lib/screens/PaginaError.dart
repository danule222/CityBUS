import 'package:flutter/material.dart';

class PaginaError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recurso no disponible"),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Image.asset("assets/images/icon/bus.png"),
              ),
              Text("La ciudad a la que intenta acceder todavía no está disponible."),
              Text("Disculpe las molestias.")
            ],
          )
        ));
  }
}
