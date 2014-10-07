import 'package:polymer/polymer.dart';
import 'dart:html' show Event, Node;
import 'dart:web_audio';
import '../lib/models/soundforge_models.dart';

@CustomTag('soundforge-app')
class SoundforgeApp extends PolymerElement {
  SoundforgeApp.created() : super.created() {
    AudioContext context = AudioContextWrapper.context;
    HttpFile file = new HttpFile("http://localhost:63342/Soundforge/web/test.ogg");
    file.load().then((_){

      var node = file.getSourceNode();
      node.connectNode(context.destination);
      node.start();
    });
  }
}