import 'package:polymer/polymer.dart';
import 'dart:html' show Event, Node;
import '../lib/models/soundforge_models.dart';

@CustomTag('soundforge-app')
class SoundforgeApp extends PolymerElement {
  SoundforgeApp.created() : super.created() {
    HttpFile file = new HttpFile("http://localhost:63342/Soundforge/web/test.ogg");

    file.load().then((_){
      print(file.buffer.duration);
    });
  }
}