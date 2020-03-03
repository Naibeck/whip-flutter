import 'package:shake/shake.dart';
import 'package:whipit/manager/WhipSoundPlayer.dart';

class ShakeManager {
  ShakeDetector _detector = ShakeDetector.waitForStart(onPhoneShake: () {
    WhipSoundPlayerManager().playWhipSound();
  });

  void startListening() => _detector.startListening();
  void stopListening() => _detector.stopListening();
}
