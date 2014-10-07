part of soundforge_models;

class HttpFile extends AudioFile {
  String _url;
  String _name;
  AudioBuffer _buffer;
  AudioContext audioContext;

  Future load(){
    Completer completer = new Completer();
    audioContext = new AudioContext();
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

  AudioBuffer get buffer => _buffer;

  HttpFile(String url) {
    _url = url;
  }
}
