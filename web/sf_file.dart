import 'package:polymer/polymer.dart';
import 'dart:html' show Event, Node;
import 'dart:web_audio';
import '../lib/models/soundforge_models.dart';



@CustomTag('sf-file')
class SfFile extends PolymerElement {
  @published AudioFile file;

  SfFile.created() : super.created() { }
}