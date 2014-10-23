import 'package:polymer/polymer.dart';
import 'dart:html' show Event, Node;
import 'dart:web_audio';
import '../../lib/models/soundforge_models.dart';

@CustomTag('sf-drive-chooser')
class SfDriveChooser extends PolymerElement {
  @observable bool authenticated = false;

  SfDriveChooser.created() : super.created() {

  }

  void doLogin(Event e, var detail, Node sender){
    print("Logging in");
  }

  void toggle(){
    shadowRoot.querySelector('paper-dialog').toggle();
  }
}