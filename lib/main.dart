import 'package:flutter/material.dart';
import 'package:guest_list/app_scaffold.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatefulWidget {
	@override
	_MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'HatchGarage',
			home: MyAppScaffold(),
		);
	}
}