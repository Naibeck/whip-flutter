import 'package:audioplayers/audio_cache.dart';

class WhipSoundPlayerManager {
  static final WhipSoundPlayerManager _singleton =
      WhipSoundPlayerManager._internal();
  static final AudioCache _audioCache = AudioCache();

  factory WhipSoundPlayerManager() => _singleton;

  void playWhipSound() {
    _audioCache.play('whip.wav');
  }

  WhipSoundPlayerManager._internal();
}
