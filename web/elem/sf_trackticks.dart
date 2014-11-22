import 'package:polymer/polymer.dart';
import 'dart:html' show Event, Node;
import 'dart:web_audio';
import '../../lib/models/soundforge_models.dart';

@CustomTag('sf-trackticks')
class SfTrackticks extends PolymerElement {
  @published int duration;
  @published double scale;
  @published int head_pos;
  @published bool is_playing;
  @observable int width;
  @observable List<String> tickpoints = toObservable([]);

  durationChanged(o,v)=>_updateWidth();
  scaleChanged(o,v)=>_updateWidth();

  _updateWidth(){
    width = (duration * scale).floor();
    tickpoints = toObservable([]);
    for (var i = 0; i < width; i = i + 200) {
      tickpoints.add(Utils.formatTimeCode((i/scale).floor()));
    }
  }

  SfTrackticks.created() : super.created() {

  }

  SfTrackticks.ready() : super.ready(){
  }
}