import 'dart:core';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class MyAppScaffold extends StatefulWidget {
	@override
	_MyAppScaffoldState createState() => _MyAppScaffoldState();
}

class _MyAppScaffoldState extends State<MyAppScaffold> {
	final List<TableRow> _tableRows = [
		TableRow(
			children: <Widget>[
				Text('Date', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
				Text('Address', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
				Text('Time Slot', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
			]
		),
		TableRow(
			children: <Widget>[
				SizedBox(height: 10.0),
				SizedBox(height: 10.0),
				SizedBox(height: 10.0)
			]
		)
	];

	scanQR() async {
		String lineColor = '#ff0000';
		String cancelBtnText = 'CANCEL';
		bool flashBtn = true;
		String barcodeResult = await FlutterBarcodeScanner.scanBarcode(lineColor, cancelBtnText, flashBtn, null);
		List<String> qrSplit = barcodeResult.split(";");
		var dateNow = new DateTime.now();
		String dateString = dateNow.toString();

		setState(() {
			_tableRows.add(
				TableRow(
					children: <Widget>[
						Text(dateString, textAlign: TextAlign.center),
						Text('${qrSplit[0]}', textAlign: TextAlign.center),
						Text('${qrSplit[1]}', textAlign: TextAlign.center)
					]
				)
			);
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('HatchGarage'),
			),
			body: Column(
				children: <Widget>[
					Center(
						child: Card(
							child: Column(
								mainAxisSize: MainAxisSize.max,
								children: <Widget>[
									SizedBox(height: 20.0),
									Text('Guests', style: TextStyle(fontSize: 24.0)),
									Divider(),
									SizedBox(height: 20.0),
									Table(children: _tableRows),
									SizedBox(height: 20.0)
								],
							),
						),
					),
					Center(
						child: Card(
							child: Column(
								mainAxisSize: MainAxisSize.max,
								children: <Widget>[
									SizedBox(height: 20.0),
									Text('Scan Invitation', style: TextStyle(fontSize: 24.0)),
									Divider(),
									ButtonTheme(
										minWidth: 300.0,
										child: RaisedButton(
											onPressed: () {
												scanQR();
											},
											child: Text('Scan'),
										)
									),
									SizedBox(height: 10.0)
								],
							)
						)
					)
				],
			),
			bottomNavigationBar: BottomNavigationBar(
				items: <BottomNavigationBarItem>[
					BottomNavigationBarItem(
						icon: Icon(FontAwesomeIcons.qrcode),
						title: Text('Scan')
					),
					BottomNavigationBarItem(
						icon: Icon(FontAwesomeIcons.list),
						title: Text('Attendees')
					)
				],
			),
		);
	}
}