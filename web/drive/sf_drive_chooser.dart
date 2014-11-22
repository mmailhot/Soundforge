import 'package:polymer/polymer.dart';
import 'dart:html' show Event, Node;
import 'dart:web_audio';
import '../../lib/models/soundforge_models.dart';
import "package:googleapis_auth/auth_browser.dart";
import "package:googleapis/drive/v2.dart";


@CustomTag('sf-drive-chooser')
class SfDriveChooser extends PolymerElement {
  @observable bool authenticated = false;
  @observable List<File> availableFiles = toObservable([]);
  AuthClient _secureClient;

  SfDriveChooser.created() : super.created() {

  }

  void doLogin(Event e, var detail, Node sender){
    var clientId = new ClientId("1019284877815-g7pd90avg10bj8m9p57mkpqhi8lrp89a.apps.googleusercontent.com",null);
    var scopes = ["https://www.googleapis.com/auth/drive.readonly"];
    createImplicitBrowserFlow(clientId,scopes).then((BrowserOAuth2Flow flow){
      flow.clientViaUserConsent().then((AuthClient client){
        _secureClient = client;
        getFiles();
        flow.close();
        authenticated = true;
      });
    });
  }

  void getFiles(){
    var drive = new DriveApi(_secureClient);
    availableFiles = toObservable([]);
    drive.files.list().then((files){
       files.items.forEach((File f){

         if(f.mimeType.startsWith("audio") || f.mimeType.contains("application/ogg")){
           availableFiles.add(f);
         }
       });
    });
  }
  void fileSelected(Event e, var detail, Node sender){
    e.stopPropagation();
    var dialog = shadowRoot.querySelector('paper-dialog');
    detail['file'].load(_secureClient).then((_){
      this.fire('fileloaded',detail:{'file': detail['file']});
    });
  }
  void toggle(){
    shadowRoot.querySelector('paper-dialog').toggle();
  }
}