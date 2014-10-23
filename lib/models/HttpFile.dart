part of soundforge_models;

class HttpFile extends AudioFile {
  String _url;
  String _name;
  AudioBuffer _buffer;
  AudioContext audioContext;

  Future load(){
    Completer completer = new Completer();
    HttpRequest xhr = new HttpRequest();
    xhr.open("GET",_url);
    xhr.responseType = "arraybuffer";
    xhr.onLoadEnd.listen((_) {
      audioContext.decodeAudioData(xhr.response).then( (buffer){
        _buffer = buffer;
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

  HttpFile(String url) {
    audioContext = AudioContextWrapper.context;
    _url = url;
    _name = Uri.decodeComponent(url.split('/').last);
  }
}
