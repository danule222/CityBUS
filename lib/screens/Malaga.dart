import 'dart:convert';

import 'package:citybus/common/Bus.dart';
import 'package:citybus/models/BusMalaga.dart';
import 'package:citybus/models/ParadaMalaga.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<List<BusMalaga>> fetchBuses() async {
  final response =
      await http.get('https://datosabiertos.malaga.eu/recursos/transporte/EMT/'
          'EMTlineasUbicaciones/lineasyubicaciones.geojson');

  if (response.statusCode == 200) {
    return busMalagaFromJson(response.body);
  } else {
    throw Exception('Error al obtener los buses de Málaga.');
  }
}

Future<List<ParadaMalaga>> fetchParadas() async {
  final response =
      await http.get('https://datosabiertos.malaga.eu/recursos/transporte/EMT/'
          'EMTLineasYParadas/lineasyparadas.geojson');
  String body = utf8.decode(response.bodyBytes);

  if (response.statusCode == 200) {
    return paradaMalagaFromJson(body);
  } else {
    throw Exception('Error al obtener las paradas de Málaga.');
  }
}

class Malaga extends StatefulWidget {
  @override
  Screen createState() => new Screen();
}

class Screen extends State<Malaga> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Buses de Málaga"),
        backgroundColor: Color.fromARGB(255, 34, 50, 127),
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder<List<ParadaMalaga>>(
            future: fetchParadas(),
            builder: (context, parada) {
              if (parada.hasData) {
                return FutureBuilder<List<BusMalaga>>(
                  future: fetchBuses(),
                  builder: (context, bus) {
                    if (bus.hasData) {
                      return Container(
                        child: Expanded(
                          child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: bus.data.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 5,
                                );
                              },
                              itemBuilder: (context, index) {
                                var linea = bus.data.elementAt(index).codLinea;
                                var sentido = bus.data.elementAt(index).sentido;
                                var last = bus.data.length == (index + 1);
                                return Container(
                                  padding: EdgeInsets.only(
                                      top: index == 0 ? 5 : 0,
                                      bottom: last ? 90 : 0),
                                  child: Bus(
                                      linea,
                                      parada.data
                                          .where((ln) =>
                                              (ln.codLineaStr + ".0") == linea)
                                          .first
                                          .nombreLinea,
                                      sentido,
                                  bus.data.elementAt(index)),
                                );
                              }),
                        ),
                      );
                    } else if (bus.hasError) {
                      return Text("${bus.error} - Bus");
                    }
                    return Center(
                      heightFactor: height * 0.023,
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              } else if (parada.hasError) {
                return Text("${parada.error} - Parada");
              }
              return Center(
                heightFactor: height * 0.023,
                child: CircularProgressIndicator(),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        backgroundColor: Color.fromARGB(255, 247, 43, 28),
        child: Icon(Icons.bus_alert),
      ),
    );
  }
}
