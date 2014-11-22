import 'package:polymer/polymer.dart';
import 'dart:html' show Event, Node;
import 'dart:web_audio';
import '../lib/models/soundforge_models.dart';

@CustomTag('sf-filelist')
class SfFileList extends PolymerElement {
  @observable List<AudioFile> files = toObservable([]);
  SfFileList.created() : super.created() {

  }

  void openDriveFileSelector(){
    shadowRoot.querySelector('sf-drive-chooser').toggle();
  }

  void addFile(Event e, var detail, Node sender){
    files.add(detail['file']);
  }

  SfFileList.ready() : super.ready(){
  }
}