import 'package:flutter/material.dart';

main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home();
  }
}

class _Home extends State<HomePage> {
  // This string will hold what is being typed by apppending at the end on each key press
  String value = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(border: Border.all(width: 2)),
                  child: Center(
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 30, color: Colors.red),
                    ),
                  )),
              Wrap(children: makeButtons()),
            ],
          ),
        ));
  }

  makeButtons() {
    List<Widget> btns = [];
    List<Widget> btns2 = [
      Padding(
        padding: EdgeInsets.all(10),
        child: RaisedButton(
          child: Text("+"),
          onPressed: () {},
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: RaisedButton(
          child: Text("0"),
          onPressed: () {},
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: RaisedButton(
          child: Text("="),
          onPressed: () {},
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: RaisedButton(
          child: Text("*"),
          onPressed: () {},
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: RaisedButton(
          child: Text("/"),
          onPressed: () {},
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: RaisedButton(
          child: Text("CLEAR"),
          onPressed: () {
            setState(() {
              setState(() {
                value = "";
              });
            });
          },
        ),
      ),
    ];
    for (int i = 1; i <= 9; i++) {
      btns.add(
        Padding(
          padding: EdgeInsets.all(10),
          child: RaisedButton(
            child: Text("$i"),
            onPressed: () {
              setState(() {
                value += "$i";
              });
            },
          ),
        ),
      );
    }

    return btns + btns2;
  }
}
