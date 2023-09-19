import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class AudioController extends ChangeNotifier {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  AudioController() {
    assetsAudioPlayer.open(
      Audio('assets/audio/ram_siya_ram.mp3'),
    );
  }

  Play() {
    assetsAudioPlayer.play();
    notifyListeners();
  }

  Pause() {
    assetsAudioPlayer.pause();
    notifyListeners();
  }
}
