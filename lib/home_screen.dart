import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:loading/indicator/line_scale_pulse_out_indicator.dart';
import 'package:loading/loading.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/idle_dots.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final player = AudioPlayer();
  final _planetRockUrl = 'https://radio.hallelradio.org/radio/8010/radio.mp3';
  final _planetRockImage = 'assets/Logohallel.png';
  var state;


  @override
void initState() {
  super.initState();
  state = false;
  setURL();
  iniciarTransmision();
}

void setURL() async => await player.setUrl(_planetRockUrl);

  void iniciarTransmision()async{
    try {
      player.play();
      setState(()=> state = true);
    } catch (t) {
        //mp3 unreachable
        print("error: " + t);
    } 
}

void finalizarTransmision()async{
    try {
  player.pause();
      setState(()=> state = false);
    } catch (t) {
        //mp3 unreachable
        print("error: " + t);
    } 
}

_launchURL() async {
  const url = 'https://hallelradio.org';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(22, 29, 55, 1),
        title: Text('Hallel Radio'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Container(
          child: Center(
            child: state ?  Loading(
                  indicator: LineScalePulseOutIndicator(),
                  size: 100,
                  color: Color.fromRGBO(22, 29, 55, 1),
                ) :
                IdleDots(color: Color.fromRGBO(22, 29, 55, 1)),
            ),
          ),
        ),
      bottomSheet: Container(
        color: Color.fromRGBO(22, 29, 55, 1),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 50,
                width: 50,
                child: Image.asset(_planetRockImage),
              ),
            ),
            state ? IconButton(
                      icon: Icon(
                        Icons.pause,
                        size: 32,
                        color: Colors.white,
                      ),
                      onPressed: () => finalizarTransmision(),
                    ) : 
                    IconButton(
                      icon: Icon(
                        Icons.play_arrow,
                        size: 32,
                        color: Colors.white,
                      ),
                      onPressed: () => iniciarTransmision(),
                    ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                      icon: Icon(
                        Icons.web_asset_outlined,
                        size: 32,
                        color: Colors.white,
                      ),
                      onPressed: () => _launchURL(),
                    ),
                        
            )
          ],
        ),
      ),
    );
  }
}
