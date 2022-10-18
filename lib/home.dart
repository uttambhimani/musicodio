import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:musicodio/homeprovider.dart';
import 'package:provider/provider.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  
  HomeProvider? hpf;
  HomeProvider? hpt;
  
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration d1 = Duration(seconds: 0);
  
  @override
  void initState(){
    super.initState();
    
    assetsAudioPlayer.open(
      Audio.network("https://cdn.ststusqeen.com/ringtones/preview/Phir_Na_Aisi_Raat_Aayegi_Ringtone-1426.mp3"),
      autoStart: false,
      showNotification: true,);

     assetsAudioPlayer.current.listen((event) {
       d1=event!.audio.duration;
     });
    
  }
  @override
  Widget build(BuildContext context) {
    hpf = Provider.of<HomeProvider>(context,listen: false);
    hpt = Provider.of<HomeProvider>(context,listen: true);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){
              hpf!.playPuse();
                 if(hpf!.isPlay==true){
                   assetsAudioPlayer.play();
                 }
                 else{
                   assetsAudioPlayer.pause();
                 };
              }, icon:Icon(hpt!.isPlay?Icons.pause_circle:Icons.play_circle) ,
              ),
              assetsAudioPlayer.builderCurrentPosition(
                builder: (context,duration) {
                  return Slider(
                      max: d1.inSeconds.toDouble(),
                      value: duration.inSeconds.toDouble(),
                      onChanged: (valu) {
                        assetsAudioPlayer.seek(Duration(seconds: valu.toInt()));
                      });
                }),
            SizedBox(height: 20,),
            Text("${d1}"),
            ],
          ),
        ),
      ),
    );
  }
}
