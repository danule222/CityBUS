import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class Mapa extends StatelessWidget {
  final latitud;
  final longitud;

  const Mapa(this.latitud, this.longitud);

  @override
  Widget build(BuildContext context) {
    var lat = double.parse(latitud);
    var lng = double.parse(longitud);
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.8,
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(lat, lng),
          zoom: 17.0,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 60.0,
                height: 60.0,
                point: LatLng(lat, lng),
                builder: (ctx) => Container(
                  child: Image.asset("assets/images/icon/bus.png"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
