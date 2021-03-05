import 'package:citybus/screens/BusDetails.dart';
import 'package:flutter/material.dart';

class Bus extends StatelessWidget {
  final linea;
  final nombreLinea;
  final sentido;
  final bus;

  Bus(this.linea, this.nombreLinea, this.sentido, this.bus);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var idaVuelta = sentido == '1' ? 'IDA': 'VUELTA';
    return InkWell(
      onTap: () {
        Navigator.push
          (context, MaterialPageRoute(
          builder: (context) => BusDetails(bus: bus)
        ));
      },
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: width * 0.80 - 10,
                      padding: EdgeInsets.all(5),
                      child: Text(idaVuelta, style: TextStyle(
                        color: Color.fromARGB(255, 247, 43, 28),
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: Container(
                          width: width * 0.80 - 10,
                          padding: EdgeInsets.all(5),
                          child: Text(
                            nombreLinea,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'IBM Plex Sans',
                                fontSize: 21),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: width * 0.20,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Image.asset(
                                "assets/images/logo/malaga.png",
                                height: 50,
                              ),
                              margin: EdgeInsets.all(6),
                            ),
                            Container(
                              child: Text(
                                'L' + linea.replaceAll('.0', ''),
                                style: TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'IBM Plex Sans',
                                    fontWeight: FontWeight.bold),
                              ),
                              margin: EdgeInsets.only(right: 6),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            width: width,
            height: 120,
            margin: EdgeInsets.only(right: 5, left: 5),
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(
                  image: AssetImage("assets/images/bus/malaga.png"),
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.centerLeft),
            ),
          )
        ],
      ),
    );
  }
}
