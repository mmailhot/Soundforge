import 'package:polymer/polymer.dart';
import 'dart:html' show Event, Node;
import 'dart:web_audio';
import '../lib/models/soundforge_models.dart';

@CustomTag('sf-filelist')
class SfFileList extends PolymerElement {
  @observable List<AudioFile> files = toObservable([]);
  SfFileList.created() : super.created() {
    HttpFile file2 = new HttpFile("https://dl.dropboxusercontent.com/u/4323319/03%20Here%20It%20Goes%20Again.ogg");
    HttpFile file = new HttpFile("http://localhost:63342/Soundforge/web/test.ogg");
    files.add(file);
    files.add(file);
    files.add(file);
    files.add(file2);
    files.add(file);
  }
}