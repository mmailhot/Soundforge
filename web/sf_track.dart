import 'package:polymer/polymer.dart';
import 'dart:html' show Event, Node, MouseEvent;
import 'dart:web_audio';
import '../lib/models/soundforge_models.dart';

@CustomTag('sf-track')
class SfTrack extends PolymerElement {
  @published Track track;
  @published int duration;
  @published double scale;
  @observable double width;

  durationChanged(o,v)=>_updateWidth();
  scaleChanged(o,v)=>_updateWidth();

  _updateWidth(){
    width = duration * scale;
  }

  void handleDrag(MouseEvent e){

    if(e.dataTransfer.types.contains("sf/dragclip")) {
      if (ClipHolder.get() != null) {
        Clip clip = ClipHolder.get();
        if (track.clips.contains(clip)) {
          clip.start = ((e.page.x - this.offset.topLeft.x) / scale).floor();
        }
      }
    }else if(e.dataTransfer.types.contains("sf/addclip")){
      print("DRAG");
      e.preventDefault();
      e.dataTransfer.dropEffect = "copy";
    }

  }

  void handleDrop(MouseEvent e){
    print("DROP");
    e.preventDefault();
    e.stopPropagation();
    if(e.dataTransfer.types.contains("sf/addclip")){
      if(FileHolder.get() != null) {
        AudioFile file = FileHolder.get();
        Clip clip = new Clip(file,((e.page.x - this.offset.topLeft.x) / scale).floor());
        track.clips.add(clip);
      }
    }
  }

  SfTrack.created() : super.created() {
  }

  SfTrack.ready() : super.ready(){
  }
}