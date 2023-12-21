import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 가로모드로 고정
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft
    ]);


    return Scaffold(
        appBar: AppBar(
          title: Text('실로폰'),
        ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          gunban('도', Colors.red, 8),
          gunban('레', Colors.orange, 16),
          gunban('미', Colors.yellow, 24),
          gunban('파', Colors.green, 32),
          gunban('솔', Colors.blue, 40),
          gunban('라', Colors.lightBlueAccent, 48),
          gunban('시', Colors.purple, 56),
        ],
      ),
    );
  }

  Widget gunban(String text, Color color, double size) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size),
      child: Container(
        width: 50,
        height: double.infinity,
        color: color,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
