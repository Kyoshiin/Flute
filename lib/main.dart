import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(FluteApp());
}

class FluteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text('Flute'),
        ),
        body: AppBody(),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  double height, width;
  final cache = AudioCache();
  AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: 0.04 * height, horizontal: 0.1 * width),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Container(
          color: Colors.white30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildbtn('c4'),
                  buildbtn('d4'),
                  buildbtn('e4'),
                  buildbtn('f4'),
                  buildbtn('g4'),
                  buildbtn('a4'),
                  buildbtn('b4'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildbtn('c5'),
                  buildbtn('d5'),
                  buildbtn('e5'),
                  buildbtn('f5'),
                  buildbtn('g5'),
                  buildbtn('a5'),
                  buildbtn('b5'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildbtn(String note) {
    return CircleAvatar(
      radius: 0.09 * width,
      backgroundColor: Colors.brown[800],
      child: CircleAvatar(
        radius: 0.077 * width,
        backgroundColor: Colors.yellow[200],
        child: FlatButton(
          child: Text(note),
          onPressed: () {
            playnote(note);
          },
        ),
      ),
    );
  }

  void playnote(String s) async {
    player?.stop();
    player = await cache.play('$s.wav');
  }
}
