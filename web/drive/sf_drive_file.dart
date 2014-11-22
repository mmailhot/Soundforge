import 'package:polymer/polymer.dart';
import 'dart:html' show Event, Node;
import 'dart:web_audio';
import '../../lib/models/soundforge_models.dart';
import "package:googleapis_auth/auth_browser.dart";
import "package:googleapis/drive/v2.dart";


@CustomTag('sf-drive-file')
class SfDriveFile extends PolymerElement {
  @published File file;

  SfDriveFile.created() : super.created() {

  }

  void loadFile(Event e, var detail, Node sender){
    DriveFile df = new DriveFile(file);
    this.fire("fileselected",detail: {'file': df});
  }


}