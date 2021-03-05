// To parse this JSON data, do
//
//     final busMalaga = busMalagaFromJson(jsonString);

import 'dart:convert';

List<BusMalaga> busMalagaFromJson(String str) => List<BusMalaga>.from(json.decode(str).map((x) => BusMalaga.fromJson(x)));

String busMalagaToJson(List<BusMalaga> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BusMalaga {
  BusMalaga({
    this.geometryName,
    this.geometry,
    this.codBus,
    this.codLinea,
    this.sentido,
    this.type,
    this.properties,
    this.codParIni,
  });

  GeometryName geometryName;
  Geometry geometry;
  String codBus;
  String codLinea;
  String sentido;
  BusMalagaType type;
  Properties properties;
  String codParIni;

  factory BusMalaga.fromJson(Map<String, dynamic> json) => BusMalaga(
    geometryName: geometryNameValues.map[json["geometry_name"]],
    geometry: Geometry.fromJson(json["geometry"]),
    codBus: json["codBus"],
    codLinea: json["codLinea"],
    sentido: json["sentido"],
    type: busMalagaTypeValues.map[json["type"]],
    properties: Properties.fromJson(json["properties"]),
    codParIni: json["codParIni"],
  );

  Map<String, dynamic> toJson() => {
    "geometry_name": geometryNameValues.reverse[geometryName],
    "geometry": geometry.toJson(),
    "codBus": codBus,
    "codLinea": codLinea,
    "sentido": sentido,
    "type": busMalagaTypeValues.reverse[type],
    "properties": properties.toJson(),
    "codParIni": codParIni,
  };
}

class Geometry {
  Geometry({
    this.type,
    this.coordinates,
  });

  GeometryType type;
  List<String> coordinates;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    type: geometryTypeValues.map[json["type"]],
    coordinates: List<String>.from(json["coordinates"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": geometryTypeValues.reverse[type],
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}

enum GeometryType { POINT }

final geometryTypeValues = EnumValues({
  "Point": GeometryType.POINT
});

enum GeometryName { WKB_GEOMETRY }

final geometryNameValues = EnumValues({
  "wkb_geometry": GeometryName.WKB_GEOMETRY
});

class Properties {
  Properties({
    this.codLinea,
    this.codBus,
    this.sentido,
    this.codParIni,
    this.lastUpdate,
  });

  String codLinea;
  String codBus;
  String sentido;
  String codParIni;
  DateTime lastUpdate;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    codLinea: json["codLinea"],
    codBus: json["codBus"],
    sentido: json["sentido"],
    codParIni: json["codParIni"],
    lastUpdate: DateTime.parse(json["last_update"]),
  );

  Map<String, dynamic> toJson() => {
    "codLinea": codLinea,
    "codBus": codBus,
    "sentido": sentido,
    "codParIni": codParIni,
    "last_update": lastUpdate.toIso8601String(),
  };
}

enum BusMalagaType { FEATURE }

final busMalagaTypeValues = EnumValues({
  "Feature": BusMalagaType.FEATURE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
