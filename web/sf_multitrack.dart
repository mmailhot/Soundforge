import 'package:polymer/polymer.dart';
import 'dart:html' show Event, Node, window;
import 'dart:web_audio';
import '../lib/models/soundforge_models.dart';

@CustomTag('sf-multitrack')
class SfMultitrack extends PolymerElement {
  @published Project project;
  @observable bool isPlaying = false;
  @observable String icon = "av:play-arrow";
  int _animFrame = 0;
  @observable int headPosition = 0;

  void togglePlay(Event e, var detail, Node sender){
    e.preventDefault();
    project.onPlaybackEnd = _updatePlayStatus;
    if(!project.playing){
      project.play();
    }else{
      project.stop();
    }
    _updatePlayStatus();
  }

  void _updatePlayStatus(){
      isPlaying = project.playing;
      icon = isPlaying ? "av:stop" : "av:play-arrow";
      if(isPlaying){
        _animFrame = window.requestAnimationFrame(_update);
      }else{
        window.cancelAnimationFrame(_animFrame);
      }
  }

  void zoomIn(){
    print("ZOOM ZOOM ZOOM");
    project.scale = project.scale * 1.1;
    print(project.scale);
  }

  void _update(num time){
    _animFrame = window.requestAnimationFrame(_update);
    headPosition = (project.getPlaybackPosition() * project.scale).floor();
  }

  void zoomOut(){
    project.scale = project.scale / 1.1;
  }

  SfMultitrack.created() : super.created() {

  }

  SfMultitrack.ready() : super.ready(){
  }
}