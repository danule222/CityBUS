import 'package:citybus/common/Relleno.dart';
import 'package:citybus/common/City.dart';
import 'package:citybus/screens/Malaga.dart';
import 'package:citybus/screens/PaginaError.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CityBUS',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'CityBUS'),
      routes: {'/malaga': (context) => Malaga()},
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext builder) => PaginaError());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                Relleno(5.0),
                City("Málaga", "malaga"),
                Relleno(5.0),
                City("Zaragoza", "zaragoza"),
                Relleno(5.0),
                City("Madrid", "madrid"),
                Relleno(5.0),
                City("Barcelona", "barcelona"),
                Relleno(5.0),
                City("Marbella", "marbella"),
                Relleno(5.0),
                City("Gijón", "gijon"),
                Relleno(90.0)
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.bus_alert),
      ),
    );
  }
}
