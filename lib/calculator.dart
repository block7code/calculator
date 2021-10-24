import 'package:flutter/material.dart';
import 'package:kalkulator/display.dart';
import 'package:kalkulator/key-controller.dart';
import 'package:kalkulator/key-pad.dart';
import 'package:kalkulator/processor.dart';

class Calculator extends StatefulWidget {

	Calculator({ Key key }) : super(key: key);

	@override
	_CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

	String _output;

	@override
	void initState() {
		
		KeyController.listen((event) => Processor.process(event));
		Processor.listen((data) => setState(() { _output = data; }));
		Processor.refresh();
		super.initState();
	}

	@override
	void dispose() {

		KeyController.dispose();
		Processor.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {

		Size screen = MediaQuery.of(context).size;

		double buttonSize = screen.width / 4;
		double displayHeight = screen.height - (buttonSize * 5) - (buttonSize);
	
		return Scaffold(
			backgroundColor: Color.fromARGB(196, 77, 77, 78),
			// backgroundColor: Color.fromARGB(196,251,177,23),
			body: Column(
				
				mainAxisAlignment: MainAxisAlignment.center,
				children: <Widget>[

					Display(value: _output, height: displayHeight),
					KeyPad()
				]
			),
		);
	}
}