import 'package:flutter/material.dart';

get_screen(String value){
  return new Container(
    width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(border: Border.all(width: 2)),
                  child: Center(
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 30, color: Colors.red),
                    ),
                  )
  );
}


// void main() => runApp(Screen);

// class Screen extends StatefulWidget{

// }