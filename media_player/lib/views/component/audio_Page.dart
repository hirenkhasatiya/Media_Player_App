import 'package:flutter/material.dart';
import 'package:media_player/controller/audio_Controller.dart';
import 'package:provider/provider.dart';

class audioPage extends StatelessWidget {
  const audioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioController>(builder: (context, Provider, child) {
      return Padding(
          padding: EdgeInsets.all(10),
          child: StreamBuilder(
            stream: Provider.assetsAudioPlayer.currentPosition,
            builder: (context, snapshot) {
              return Center(
                child: IconButton(
                  onPressed: () {
                    Provider.Play();
                  },
                  icon: Icon(Icons.play_arrow),
                ),
              );
            },
          ));
    });
  }
}
