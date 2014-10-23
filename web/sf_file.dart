import 'package:polymer/polymer.dart';
import 'dart:html' show Event, Node, window;
import 'dart:web_audio';
import '../lib/models/soundforge_models.dart';



@CustomTag('sf-file')
class SfFile extends PolymerElement {
  @published AudioFile file;
  @observable SimpleAudioPlayer player;

  @observable bool isPlaying = false;
  @observable String icon = "av:play-arrow";

  @observable int playbackProgress = 0;

  int _animFrame = 0;

  void togglePlay(Event e, var detail, Node sender){
    e.preventDefault();
    if(player == null){
      //TODO: Something better that this
      file.load().then((_){
        if(player != null){
          //Triggers if the player clicked play again while loading
          return;
        }
        player = new SimpleAudioPlayer(file);
        player.play();
        player.onEnd = (){
          _updatePlayStatus();
        };
        _updatePlayStatus();
      });
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

  void _update(num time){
    _animFrame = window.requestAnimationFrame(_update);
    playbackProgress = player.getPlaybackPosition();
  }

  SfFile.created() : super.created() {

  }
}