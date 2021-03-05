import 'package:citybus/common/Mapa.dart';
import 'package:citybus/models/BusMalaga.dart';
import 'package:flutter/material.dart';

class BusDetails extends StatelessWidget {
  final BusMalaga bus;

  BusDetails({Key key, @required this.bus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var idaVuelta = bus.sentido == '1' ? 'Ida' : 'Vuelta';
    return Scaffold(
        appBar: AppBar(
          title: Text("Detalles Bus " + bus.codBus),
          backgroundColor: Color.fromARGB(255, 34, 50, 127),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Mapa(bus.geometry.coordinates[1], bus.geometry.coordinates[0]),
              Container(
                height: 80,
                width: width,
                padding: EdgeInsets.all(5),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: (width * 0.5) - 5,
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 40,
                                margin: EdgeInsets.only(right: 5),
                                child: Image.asset(
                                    'assets/images/logo/malaga.png'),
                              ),
                              Text(
                                'L' + bus.codLinea.replaceAll('.0', ''),
                                style: TextStyle(
                                    fontSize: 45, fontFamily: 'IBM Plex Sans'),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: (width * 0.5) - 5,
                          child: Text(
                            idaVuelta,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 45,
                                fontFamily: 'IBM Plex Sans',
                                color: Color.fromARGB(255, 247, 43, 28)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Código de parada incial: ' + bus.codParIni),
                    Text('Última actualización: ' +
                        bus.properties.lastUpdate.day.toString() +
                        '/' +
                        bus.properties.lastUpdate.month.toString() +
                        '/' +
                        bus.properties.lastUpdate.year.toString() +
                        ' ' +
                        bus.properties.lastUpdate.hour.toString() +
                        ':' +
                        bus.properties.lastUpdate.minute.toString(),
                      style: TextStyle(
                          color: Colors.grey
                      ),)
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
