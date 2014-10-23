part of soundforge_models;

class SimpleAudioPlayer {
  AudioBuffer _buffer;
  AudioBufferSourceNode _node;
  AudioContext _audioContext;
  Timer _endTimer;
  Function _endCallback;
  int _startTime;
  bool playing = false;

  SimpleAudioPlayer(AudioFile file) {
    _audioContext = AudioContextWrapper.context;
    _buffer = file.buffer;
  }

  void _onEnd(){
    playing = false;
    if(_endCallback != null){
      _endCallback();
    }
  }

  void play(){
    if(!playing) {
      _node = _audioContext.createBufferSource();
      _node.connectNode(_audioContext.destination, 0, 0);
      _node.buffer = _buffer;
      _node.start();
      _startTime = _audioContext.currentTime;
      playing = true;
      _endTimer = new Timer(new Duration(seconds: _buffer.duration), _onEnd);
    }
  }

  int getPlaybackPosition(){
    if(!playing){
      return 0;
    }
    return (_audioContext.currentTime - _startTime)/(_buffer.duration) * 100;
  }

  void stop(){
    if(playing){
      playing = false;
      _endTimer.cancel();
      _node.stop();
    }

  }

  void set onEnd(Function callback){
    _endCallback = callback;
  }
}
