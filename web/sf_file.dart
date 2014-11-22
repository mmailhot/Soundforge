import 'package:polymer/polymer.dart';
import 'dart:html' show MouseEvent, Event, Node, window;
import 'dart:web_audio';
import '../lib/models/soundforge_models.dart';



@CustomTag('sf-file')
class SfFile extends PolymerElement {

  AudioFile _file;

  @published AudioFile get file => _file;
  @published void set file(AudioFile file){
    player = null;
    if(file.loaded){
      player = new SimpleAudioPlayer(file);
    }else{
      file.load().then((_){
        player = new SimpleAudioPlayer(file);
      });
    }

    _file = file;
  }

  @observable SimpleAudioPlayer player;

  @observable bool isPlaying = false;
  @observable String icon = "av:play-arrow";

  @observable int playbackProgress = 0;

  int _animFrame = 0;

  void togglePlay(Event e, var detail, Node sender){
    e.preventDefault();
    if(player == null){
      return;
    }else{
      if(!player.playing){
        player.play();
      }else{
        player.stop();
      }

    }
    _updatePlayStatus();
  }

  void _updatePlayStatus(){
    if(player != null){
      icon = player.playing ? "av:stop" : "av:play-arrow";
      isPlaying = player.playing;

      if(isPlaying){
        _animFrame = window.requestAnimationFrame(_update);
      }else{
        window.cancelAnimationFrame(_animFrame);
      }
    }

  }

  void startDrag(MouseEvent e){
    e.dataTransfer.setData("sf/addclip","true");
    e.dataTransfer.effectAllowed = "copy";
    e.dataTransfer.dropEffect = "copy";
    FileHolder.add(file);
  }

  void _update(num time){
    _animFrame = window.requestAnimationFrame(_update);
    playbackProgress = player.getPlaybackPosition();
  }

  SfFile.created() : super.created() {
  }
}