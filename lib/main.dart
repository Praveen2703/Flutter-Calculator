import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(buttonText) {
    if (buttonText == "RESET") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already contains a decimal");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
      //_output = "0";
    } else {
      _output = _output + buttonText;
    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          buttonPressed(buttonText);
        },
        child: Text(buttonText),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20.0),
          primary: Colors.teal,
          side: BorderSide(
            width: 2.0,
            color: Colors.brown,
          ),
          //onSurface: Colors.grey,
          textStyle: TextStyle(
            color: Colors.brown,
            fontSize: 30,
            //fontStyle: FontStyle.italic
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.centerRight,
                  padding:
                      EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                  child: Text(output,
                      style: TextStyle(
                          fontSize: 48.0, fontWeight: FontWeight.bold))),
              Expanded(
                child: Divider(),
              ),
              Column(
                children: [
                  Row(children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("+")
                  ]),
                  Row(children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("-")
                  ]),
                  Row(children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("*")
                  ]),
                  Row(children: [
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("/")
                  ]),
                  Row(children: [buildButton("RESET"), buildButton("=")]),
                ],
              )
            ],
          ),
        ));
  }
}
