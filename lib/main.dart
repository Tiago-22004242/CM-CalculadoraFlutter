import 'package:flutter/material.dart';

import 'button.dart';
import 'calculator.dart';

void main() => runApp(FCalculador());

class FCalculador extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(title: 'FCalculador'),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  final Calculator calculator = Calculator();
  final String title;
  CalculatorScreen({required this.title});
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: <Widget>[
          buildDisplay(context, widget.calculator.expression),
          buildKeyboard(context, _doAction),
        ],
      ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.dehaze),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    HistoricScreen(calculator: widget.calculator)),
              );
            }
        )
    );
  }
  _doAction(CalculatorAction action, {String? symbol}) {
    if(CalculatorAction.ADD_SYMBOL == action) widget.calculator.addSymbol(symbol!);
    else if (CalculatorAction.EQUALS == action) widget.calculator.equals();
    else if (CalculatorAction.GET_LAST_OPERATION == action) widget.calculator.getLastOperation();
    else if (CalculatorAction.BACKSPACE == action) widget.calculator.backspace();
    else if (CalculatorAction.CLEAR == action) widget.calculator.clear();
    setState(() {});
  }

  Widget buildDisplay(BuildContext context, String expression) {
    return Container(
      color: Colors.black54,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(2.0),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.all(4.0),
              height: MediaQuery.of(context).size.height / 5,
              child: Text(
                expression,
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget buildKeyboard(BuildContext context, Function _doAction) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button(
                width: calculateButtonWidth(context),
                height: calculateButtonHeight(context),
                text: "C",
                color: Colors.grey,
                  onPressed: (symbol) => _doAction(CalculatorAction.CLEAR)
              ),
              Button(
                  width: calculateButtonWidth(context),
                  height: calculateButtonHeight(context),
                  text: "<",
                  color: Colors.grey,
                  onPressed: (symbol) => _doAction(CalculatorAction.BACKSPACE)
              ),
              Button(
                  width: calculateButtonWidth(context),
                  height: calculateButtonHeight(context),
                  text: "last",
                  color: Colors.orange,
                  onPressed: (symbol) => _doAction(CalculatorAction.GET_LAST_OPERATION)
              ),
              Button(
                  width: calculateButtonWidth(context),
                  height: calculateButtonHeight(context),
                  text: "/",
                  color: Colors.orange,
                  onPressed: (symbol) => _doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button(
                  width: calculateButtonWidth(context),
                  height: calculateButtonHeight(context),
                  text: "7",
                  color: Colors.black54,
                  onPressed: (symbol) => _doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
              Button(
                  width: calculateButtonWidth(context),
                  height: calculateButtonHeight(context),
                  text: "8",
                  color: Colors.black54,
                  onPressed: (symbol) => _doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
              Button(
                  width: calculateButtonWidth(context),
                  height: calculateButtonHeight(context),
                  text: "9",
                  color: Colors.black54,
                  onPressed: (symbol) => _doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
              Button(
                  width: calculateButtonWidth(context),
                  height: calculateButtonHeight(context),
                  text: "*",
                  color: Colors.orange,
                  onPressed: (symbol) => _doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button(
                  width: calculateButtonWidth(context),
                  height: calculateButtonHeight(context),
                  text: "4",
                  color: Colors.black54,
                  onPressed: (symbol) => _doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
              Button(
                  width: calculateButtonWidth(context),
                  height: calculateButtonHeight(context),
                  text: "5",
                  onPressed: (symbol) => _doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
              Button(
                  width: calculateButtonWidth(context),
                  height: calculateButtonHeight(context),
                  text: "6",
                  color: Colors.black54,
                  onPressed: (symbol) => _doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
              Button(
                  width: calculateButtonWidth(context),
                  height: calculateButtonHeight(context),
                  text: "-",
                  color: Colors.orange,
                  onPressed: (symbol) => _doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Button(
                  text: "1",
                  width: calculateButtonWidth(context),
                  height: calculateButtonHeight(context),
                  onPressed: (symbol) => _doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
              Button(
                  text: "2",
                  width: calculateButtonWidth(context),
                  height: calculateButtonHeight(context),
                  onPressed: (symbol) => _doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
              Button(
                  text: "3",
                  width: calculateButtonWidth(context),
                  height: calculateButtonHeight(context),
                  onPressed: (symbol) => _doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
              Button(
                  text: "+",
                  width: calculateButtonWidth(context),
                  height: calculateButtonHeight(context),
                  color: Colors.orange,
                  onPressed: (symbol) => _doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button(
                  text: "0",
                  width: calculateButtonWidth(context, isDouble: true),
                  height: calculateButtonHeight(context),
                  onPressed: (symbol) => _doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
              Button(
                  text: ".",
                  width: calculateButtonWidth(context),
                  height: calculateButtonHeight(context),
                  onPressed: (symbol) => _doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
              Button(
                  text: "=",
                  width: calculateButtonWidth(context),
                  height: calculateButtonHeight(context),
                  color: Colors.orange,
                  onPressed: (symbol) => _doAction(CalculatorAction.EQUALS),
              ),
            ],
          ),
        ],
      ),
    );
  }
  double calculateButtonWidth(context, {isDouble = false}) {
    double width = MediaQuery.of(context).size.width / 4;
    return isDouble ? (width * 2) : width;
  }

  double calculateButtonHeight(context) {
    return MediaQuery.of(context).size.height / 8;
  }
}
class HistoricScreen extends StatefulWidget {

  final Calculator calculator;

  const HistoricScreen({Key? key, required this.calculator}) : super(key: key);

  @override
  State<HistoricScreen> createState() => _HistoricScreenState();
}

class _HistoricScreenState extends State<HistoricScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Histórico"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: ListView.builder(
            itemCount: widget.calculator
                .getAllOperations()
                .length,
            itemBuilder: (context, index) {
              return
                Card(child:ListTile(
                leading: Image.asset('lib/assets/logo.jpg'),
                title: Text(widget.calculator.getAllOperations()[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailScreen(operation: widget.calculator.getAllOperations()[index], calculator: widget.calculator)),
                  );
                },
                trailing: Icon(Icons.more_vert),
              )
                );
            },
          ),
        )
    );
  }
}
class DetailScreen extends StatelessWidget {
  final String operation;
  final Calculator calculator;
  const DetailScreen({Key? key, required this.operation , required this.calculator}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Detalhes")
            ,leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ),
          body:
              ListTile(
                leading: Image.asset('lib/assets/logo.jpg'),
                title: Text(operation),
              ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              calculator.getAllOperations().remove(operation);
              Navigator.push(context,MaterialPageRoute(builder: (context) => HistoricScreen(calculator: calculator)));
            },
            child:Icon(Icons.delete),
          ) ,
          ),
        );
  }
}
