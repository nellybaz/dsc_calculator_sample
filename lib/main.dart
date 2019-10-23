import 'package:flutter/material.dart';
import 'screen.dart';

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

  // When an operand is pressed, the current value of value is captured as num1,
  // then num2 will be captured when "=" key is pressed

  String value = "0";
  int num1, num2;
  String op;

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
              getScreen(value),
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
          onPressed: () {
            num1 = int.parse(value);
            op = "+";
            setState(() {
              value = op;
            });
          },
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: RaisedButton(
          child: Text("0"),
          onPressed: () {
            setState(() {
              if (value == "0" || isOperand(value)) {
                value = "";
              }
              value += "0";
            });
          },
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: RaisedButton(
          child: Text("="),
          onPressed: () {
            num2 = int.parse(value);

            setState(() {
              if (op == "+") {
                value = (num1 + num2).toString();
              } else if (op == "/") {
                value = (num1 / num2).toString();
              } else {
                value = (num1 * num2).toString();
              }
            });
          },
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: RaisedButton(
          child: Text("*"),
          onPressed: () {
            num1 = int.parse(value);
            op = "*";
            setState(() {
              value = op;
            });
          },
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: RaisedButton(
          child: Text("/"),
          onPressed: () {
            num1 = int.parse(value);
            op = "/";
            setState(() {
              value = op;
            });
          },
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: RaisedButton(
          child: Text("CLEAR"),
          onPressed: () {
            setState(() {
              setState(() {
                value = "0";
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
                if (value == "0" || isOperand(value)) {
                  value = "";
                }
                value += "$i";
              });
            },
          ),
        ),
      );
    }

    return btns + btns2;
  }

  bool isOperand(String value) {
    return value == "+" || value == "*" || value == "-" || value == "/";
  }
}
