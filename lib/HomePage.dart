import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final player = AudioPlayer();

  void iniciarTransmision()async{
    try {
  var duration = await player.setUrl('https://radio.hallelradio.org/radio/8010/radio.mp3');
  player.play();
      print('iniciando');
    } catch (t) {
        //mp3 unreachable
        print("error: " + t);
    } 
}


@override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child:Container(
          child: ElevatedButton(
                  onPressed: ()=> iniciarTransmision(),
                  child: new Text('Hola'),)
        )
      )
    );
  }
}