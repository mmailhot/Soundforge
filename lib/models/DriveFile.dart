part of soundforge_models;

class DriveFile extends AudioFile {
  String _url;
  String _name;
  bool _loaded;
  AudioBuffer _buffer;
  AudioContext audioContext;

  Future load(AuthClient client){
    Completer completer = new Completer();
    HttpRequest xhr = new HttpRequest();
    String token = client.credentials.accessToken.data;
    xhr.open("GET",_url);
    xhr.setRequestHeader("Authorization","Bearer " + token);
    xhr.responseType = "arraybuffer";
    xhr.onLoadEnd.listen((_) {
      audioContext.decodeAudioData(xhr.response).then( (buffer){
        _buffer = buffer;
        _loaded = true;
        completer.complete();
      });
    });
    xhr.send();
    return completer.future;
  }

  AudioBufferSourceNode getSourceNode() {
    AudioBufferSourceNode node = audioContext.createBufferSource();
    node.buffer = _buffer;
    return node;
  }

  AudioBuffer get buffer => _buffer;

  String get name => _name;

  bool get loaded => _loaded;

  DriveFile(File f){
    audioContext = AudioContextWrapper.context;
    _url = f.downloadUrl;
    _name = f.title;
  }
}
