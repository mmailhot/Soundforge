import 'package:polymer/polymer.dart';
import 'dart:html' show Event, Node;
import 'dart:web_audio';
import '../lib/models/soundforge_models.dart';

@CustomTag('soundforge-app')
class SoundforgeApp extends PolymerElement {
  @observable Project project;
  SoundforgeApp.created() : super.created() {
    project = new Project();
  }
}