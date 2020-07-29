import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(FluteApp());
}

class FluteApp extends StatelessWidget {
  final cache = AudioCache();
  AudioPlayer player;
  String disclaimer = '**Disclaimer the sounds are not always correct';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text('Flute'),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 25, horizontal: 40),
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
        ),
      ),
    );
  }

  Widget buildbtn(String note) {
    return CircleAvatar(
      radius: 35,
      backgroundColor: Colors.brown[800],
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.yellow[200],
        child: FlatButton(
          child: Text(note),
          onPressed: () {
            disclaimer = '';
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
