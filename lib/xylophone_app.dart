import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({super.key});

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  // 사운드풀 객체얻기
  Soundpool pool = Soundpool.fromOptions(options: SoundpoolOptions.kDefault);

  List<int> _soundIds = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    soundPoolAdd();
  }

  Future<void> soundPoolAdd() async {
    List<Future<int>> test = [
      initSoundPool('do1.wav'),
      initSoundPool('re.wav'),
      initSoundPool('mi.wav'),
      initSoundPool('fa.wav'),
      initSoundPool('sol.wav'),
      initSoundPool('la.wav'),
      initSoundPool('si.wav'),
      initSoundPool('do2.wav')
    ];

    _soundIds = await Future.wait(test);

    setState(() {
      print(_isLoading);
      _isLoading = true;
    });
  }

  Future<int> initSoundPool(String fileName) async {
    int soundId = await rootBundle
        .load('assets/$fileName')
        .then((value) => pool.load(value));

    return soundId;
  }

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
      body: _isLoading
          ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          gunban('도', Colors.red, 8, _soundIds[0]),
          gunban('레', Colors.orange, 16, _soundIds[1]),
          gunban('미', Colors.yellow, 24, _soundIds[2]),
          gunban('파', Colors.green, 32, _soundIds[3]),
          gunban('솔', Colors.blue, 40, _soundIds[4]),
          gunban('라', Colors.lightBlueAccent, 48, _soundIds[5]),
          gunban('시', Colors.purple, 56, _soundIds[6]),
          gunban('도', Colors.pinkAccent, 64, _soundIds[7]),
        ],
      )
      : const Center(child: CircularProgressIndicator(),),
    );
  }

  Widget gunban(String text, Color color, double size, int soundId) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size),
      child: GestureDetector(
        onTap: () {
          pool.play(soundId);
        },
        child: Container(
          width: 50,
          height: double.infinity,
          color: color,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
