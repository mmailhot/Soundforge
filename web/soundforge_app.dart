import 'package:polymer/polymer.dart';
import 'dart:html' show Event, Node;
import 'dart:web_audio';
import '../lib/models/soundforge_models.dart';

@CustomTag('soundforge-app')
class SoundforgeApp extends PolymerElement {
  SoundforgeApp.created() : super.created() {
    shadowRoot.querySelector('sf-drive-chooser').toggle();
  }
}