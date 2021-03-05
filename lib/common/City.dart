import 'package:flutter/material.dart';

class City extends StatelessWidget {
  final nombre;
  final imagen;

  City(this.nombre, this.imagen);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/" + imagen);
      },
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Image.asset(
                    "assets/images/logo/" + imagen + ".png",
                    height: 50,
                  ),
                  margin: EdgeInsets.all(6),
                ),
                Container(
                  child: Text(
                    nombre,
                    style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'IBM Plex Sans',
                        fontWeight: FontWeight.bold),
                  ),
                  margin: EdgeInsets.only(right: 6),
                )
              ],
            ),
            width: width,
            height: 120,
            margin: EdgeInsets.only(right: 5, left: 5),
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(
                  image: AssetImage("assets/images/banner/" + imagen + ".png"),
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.centerLeft),
            ),
          )
        ],
      ),
    );
  }
}
