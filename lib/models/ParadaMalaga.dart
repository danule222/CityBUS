import 'dart:convert';

List<ParadaMalaga> paradaMalagaFromJson(String str) => List<ParadaMalaga>.from(
    json.decode(str).map((x) => ParadaMalaga.fromJson(x)));

String paradaMalagaToJson(List<ParadaMalaga> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ParadaMalaga {
  ParadaMalaga({
    this.codLinea,
    this.codLineaStr,
    this.codLineaStrSin,
    this.userCodLinea,
    this.nombreLinea,
    this.observaciones,
    this.cabeceraIda,
    this.cabeceraVuelta,
    this.avisoSinHorarioEs,
    this.avisoSinHorarioEn,
    this.tagsAccesibilidad,
    this.paradas,
  });

  double codLinea;
  String codLineaStr;
  String codLineaStrSin;
  String userCodLinea;
  String nombreLinea;
  String observaciones;
  String cabeceraIda;
  String cabeceraVuelta;
  String avisoSinHorarioEs;
  String avisoSinHorarioEn;
  String tagsAccesibilidad;
  List<ParadaElement> paradas;

  factory ParadaMalaga.fromJson(Map<String, dynamic> json) => ParadaMalaga(
        codLinea: json["codLinea"],
        codLineaStr: json["codLineaStr"],
        codLineaStrSin: json["codLineaStrSin"],
        userCodLinea: json["userCodLinea"],
        nombreLinea: json["nombreLinea"],
        observaciones: json["observaciones"],
        cabeceraIda: json["cabeceraIda"],
        cabeceraVuelta: json["cabeceraVuelta"],
        avisoSinHorarioEs: json["avisoSinHorarioEs"],
        avisoSinHorarioEn: json["avisoSinHorarioEn"],
        tagsAccesibilidad: json["tagsAccesibilidad"],
        paradas: List<ParadaElement>.from(
            json["paradas"].map((x) => ParadaElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "codLinea": codLinea,
        "codLineaStr": codLineaStr,
        "codLineaStrSin": codLineaStrSin,
        "userCodLinea": userCodLinea,
        "nombreLinea": nombreLinea,
        "observaciones": observaciones,
        "cabeceraIda": cabeceraIda,
        "cabeceraVuelta": cabeceraVuelta,
        "avisoSinHorarioEs": avisoSinHorarioEs,
        "avisoSinHorarioEn": avisoSinHorarioEn,
        "tagsAccesibilidad": tagsAccesibilidad,
        "paradas": List<dynamic>.from(paradas.map((x) => x.toJson())),
      };
}

class ParadaElement {
  ParadaElement({
    this.linea,
    this.parada,
    this.sentido,
    this.orden,
    this.espera,
    this.fechaInicioDemanda,
    this.fechaFinDemanda,
    this.franjas,
  });

  String linea;
  ParadaParada parada;
  int sentido;
  int orden;
  String espera;
  String fechaInicioDemanda;
  String fechaFinDemanda;
  List<Franja> franjas;

  factory ParadaElement.fromJson(Map<String, dynamic> json) => ParadaElement(
        linea: json["linea"],
        parada: ParadaParada.fromJson(json["parada"]),
        sentido: json["sentido"],
        orden: json["orden"],
        espera: json["espera"],
        fechaInicioDemanda: json["fechaInicioDemanda"],
        fechaFinDemanda: json["fechaFinDemanda"],
        franjas:
            List<Franja>.from(json["franjas"].map((x) => Franja.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "linea": linea,
        "parada": parada.toJson(),
        "sentido": sentido,
        "orden": orden,
        "espera": espera,
        "fechaInicioDemanda": fechaInicioDemanda,
        "fechaFinDemanda": fechaFinDemanda,
        "franjas": List<dynamic>.from(franjas.map((x) => x.toJson())),
      };
}

class Franja {
  Franja({
    this.horaInicio,
    this.horaFin,
    this.diaSemana,
  });

  HoraInicio horaInicio;
  HoraFin horaFin;
  String diaSemana;

  factory Franja.fromJson(Map<String, dynamic> json) => Franja(
        horaInicio: horaInicioValues.map[json["horaInicio"]],
        horaFin: horaFinValues.map[json["horaFin"]],
        diaSemana: json["diaSemana"],
      );

  Map<String, dynamic> toJson() => {
        "horaInicio": horaInicioValues.reverse[horaInicio],
        "horaFin": horaFinValues.reverse[horaFin],
        "diaSemana": diaSemana,
      };
}

enum HoraFin { THE_235900, THE_235700 }

final horaFinValues =
    EnumValues({"2357:00": HoraFin.THE_235700, "2359:00": HoraFin.THE_235900});

enum HoraInicio { THE_0000, THE_150000, THE_10100 }

final horaInicioValues = EnumValues({
  "00:00": HoraInicio.THE_0000,
  "101:00": HoraInicio.THE_10100,
  "1500:00": HoraInicio.THE_150000
});

class ParadaParada {
  ParadaParada({
    this.codParada,
    this.nombreParada,
    this.direccion,
    this.latitud,
    this.longitud,
    this.lineas,
  });

  int codParada;
  String nombreParada;
  String direccion;
  double latitud;
  double longitud;
  String lineas;

  factory ParadaParada.fromJson(Map<String, dynamic> json) => ParadaParada(
        codParada: json["codParada"],
        nombreParada: json["nombreParada"],
        direccion: json["direccion"],
        latitud: json["latitud"].toDouble(),
        longitud: json["longitud"].toDouble(),
        lineas: json["lineas"],
      );

  Map<String, dynamic> toJson() => {
        "codParada": codParada,
        "nombreParada": nombreParada,
        "direccion": direccion,
        "latitud": latitud,
        "longitud": longitud,
        "lineas": lineas,
      };
}

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
