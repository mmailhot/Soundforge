import 'package:polymer/polymer.dart';
import 'dart:html' show Event, Node, MouseEvent, Element, DivElement;
import 'dart:web_audio';
import '../lib/models/soundforge_models.dart';
import 'dart:js' show JsObject;

@CustomTag('sf-clip')
class SfClip extends PolymerElement {
  @published Clip clip;
  @published int scale;
  @observable int width;
  @observable bool beingDragged = false;

  scaleChanged(o,v)=>_updateWidth();

  _updateWidth(){
    width = clip.length * scale;
  }

  void onStartDrag(MouseEvent e){
    e.dataTransfer.setData("sf/dragclip","BLAH BLAH BLAH");
    ClipHolder.add(clip);

  }

  SfClip.created() : super.created() {
  }


}