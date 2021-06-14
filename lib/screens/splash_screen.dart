import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycrypto/utilities/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), (){
      Navigator.of(context).popAndPushNamed(HOME_SCREEN_ROUTE);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              CupertinoIcons.bitcoin,
              color: Colors.green[700],
              size: 50,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'MyCrypto',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
