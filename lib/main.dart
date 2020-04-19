import 'package:flutter/material.dart';
import 'package:calculator/calculator.dart';
import 'package:calculator/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryBackground,
        scaffoldBackgroundColor: kPrimaryBackground,
        accentColor: kSecondaryBackground,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Calculator'),
        ),
        body: CalculatorScreen(),
      ),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  Calculator brain = Calculator();
  String _outputText = '0';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 0.0),
              decoration: BoxDecoration(
                color: kSecondaryBackground,
                borderRadius: BorderRadius.circular(50.0),
              ),
              padding: EdgeInsets.all(20.0),
              child: Text(
                _outputText,
                style: kOutputStyle,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalculatorButton(
                        value: '/',
                        brain: brain,
                        onPress: () {
                          setState(() {
                            _outputText = brain.setOperator('/');
                          });
                        },
                        style: kButtonSymbolColorStyle,
                      ),
                      CalculatorButton(
                        value: '7',
                        brain: brain,
                        onPress: () {
                          setState(() {
                            _outputText = brain.sendKey('7');
                          });
                        },
                      ),
                      CalculatorButton(
                        value: '8',
                        brain: brain,
                        onPress: () {
                          setState(() {
                            _outputText = brain.sendKey('8');
                          });
                        },
                      ),
                      CalculatorButton(
                        value: '9',
                        brain: brain,
                        onPress: () {
                          setState(() {
                            _outputText = brain.sendKey('9');
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalculatorButton(
                        value: '×',
                        brain: brain,
                        onPress: () {
                          setState(() {
                            _outputText = brain.setOperator('×');
                          });
                        },
                        style: kButtonSymbolColorStyle,
                      ),
                      CalculatorButton(
                        value: '4',
                        brain: brain,
                        onPress: () {
                          setState(() {
                            _outputText = brain.sendKey('4');
                          });
                        },
                      ),
                      CalculatorButton(
                        value: '5',
                        brain: brain,
                        onPress: () {
                          setState(() {
                            _outputText = brain.sendKey('5');
                          });
                        },
                      ),
                      CalculatorButton(
                        value: '6',
                        brain: brain,
                        onPress: () {
                          setState(() {
                            _outputText = brain.sendKey('6');
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalculatorButton(
                        value: '-',
                        brain: brain,
                        onPress: () {
                          setState(() {
                            _outputText = brain.setOperator('-');
                          });
                        },
                        style: kButtonSymbolColorStyle,
                      ),
                      CalculatorButton(
                        value: '1',
                        brain: brain,
                        onPress: () {
                          setState(() {
                            _outputText = brain.sendKey('1');
                          });
                        },
                      ),
                      CalculatorButton(
                        value: '2',
                        brain: brain,
                        onPress: () {
                          setState(() {
                            _outputText = brain.sendKey('2');
                          });
                        },
                      ),
                      CalculatorButton(
                        value: '3',
                        brain: brain,
                        onPress: () {
                          setState(() {
                            _outputText = brain.sendKey('3');
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalculatorButton(
                        value: '+',
                        brain: brain,
                        onPress: () {
                          setState(() {
                            _outputText = brain.setOperator('+');
                            print(_outputText);
                          });
                        },
                        style: kButtonSymbolColorStyle,
                      ),
                      CalculatorButton(
                        value: '0',
                        brain: brain,
                        onPress: () {
                          setState(() {
                            _outputText = brain.sendKey('0');
                          });
                        },
                      ),
                      CalculatorButton(
                        value: '.',
                        brain: brain,
                        onPress: () {
                          setState(() {
                            _outputText = brain.sendKey('.');
                          });
                        },
                      ),
                      CalculatorButton(
                        value: '=',
                        brain: brain,
                        background: kPrimaryAccent,
                        onPress: () {
                          setState(() {
                            _outputText = brain.getValue();
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              brain.clearAll();
                              _outputText = '0';
                            });
                          },
                          constraints: BoxConstraints.tight(Size(170.0, 70.0)),
                          fillColor: kClearButtonColor,
                          child: Text(
                            'Clear All',
                            style: kButtonTextStyle,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                      ),
                      Container(
                        child: RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              brain.clear();
                              _outputText = '0';
                            });
                          },
                          constraints: BoxConstraints.tight(Size(70.0, 70.0)),
                          fillColor: kSecondaryBackground,
                          child: Text(
                            'C',
                            style: kButtonTextColorStyle,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                      ),
                      Container(
                        child: RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              _outputText = brain.clearLast();
                            });
                          },
                          constraints: BoxConstraints.tight(Size(70.0, 70.0)),
                          fillColor: kSecondaryBackground,
                          child: Icon(
                            Icons.backspace,
                            color: Colors.red,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String value;
  final Calculator brain;
  final Color background;
  final Function onPress;
  final TextStyle style;

  CalculatorButton(
      {@required this.value,
      this.brain,
      this.onPress,
      this.background = kSecondaryBackground, this.style = kButtonTextStyle});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      constraints: BoxConstraints.tight(Size(70.0, 70.0)),
      fillColor: this.background,
      child: Text(
        value,
        style: style,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
