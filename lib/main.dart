import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('QR Code'),
          ),
          backgroundColor: Colors.grey.shade700,
        ),
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: HomePageState(),
          ),
        ),
      ),
    );
  }
}

class HomePageState extends StatefulWidget {
  HomePageState({Key key}) : super(key: key);

  @override
  _HomePageStateState createState() => _HomePageStateState();
}

class _HomePageStateState extends State<HomePageState> {
  String _ssid = '';
  String _pwd = '';
  String _qrcoderep = '';
  bool _enable_generateQRCode = false;

  @override
  Widget build(BuildContext context) {
    _qrcoderep = '{"ssid":"$_ssid","pwd":"$_pwd"}';

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'SSID',
              ),
              // This is trigger only when the user clicks enters
              // This doesn't work for changes in the text field
              onFieldSubmitted: (String ssid) {
                setState(() {
                  _ssid = ssid;
                  print('$_ssid');
                });
              },
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: 'Password'),
              obscureText: true,
              // Similar to _ssid this works only when the user clicks enters
              onFieldSubmitted: (String pwd) {
                setState(() {
                  _pwd = pwd;
                  print('$_pwd');
                });
              },
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'Clear QR Code',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                _qrcoderep = '{"ssid":" ","pwd":""}';
                print('$_qrcoderep');
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'Generate QR Code',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: null,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: QrImage(
                data: _qrcoderep,
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
