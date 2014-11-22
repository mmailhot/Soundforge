part of soundforge_models;

@observable
class Project extends Object with Observable{
  String name;
  List<Track> tracks = toObservable([]);
  int duration = 360000;
  @observable double scale = 0.01;

  bool playing = false;
  AudioBuffer _buffer;
  List<AudioBufferSourceNode> _nodes;
  List<double> _timings;
  AudioContext _audioContext;
  Timer _endTimer;
  Function _endCallback;
  int _startTime;

  Project() {
    name = "New Project";
    tracks.add(new Track());
    tracks.add(new Track());
    _audioContext = AudioContextWrapper.context;
  }

  void _onEnd(){
    playing = false;
    if(_endCallback != null){
      _endCallback();
    }
  }

  void stop(){
    if(playing){
      playing = false;
      _endTimer.cancel();
      for(var node in _nodes){
        node.stop();
      }
    }
  }

  void play(){
    if(!playing) {
      _nodes = [];
      _timings = [];
      for(var track in tracks){
        for(var clip in track.clips){
          AudioBufferSourceNode _node = _audioContext.createBufferSource();
          _node.connectNode(_audioContext.destination,0,0);
          _node.buffer = clip.file.buffer;
          _nodes.add(_node);
          _timings.add((clip.start * 1.0)/1000);
        }
      }
      for(var i = 0; i < _nodes.length; i++){
        _nodes[i].start(_audioContext.currentTime + _timings[i]);
        print("Node " + i.toString() + " starting at " + _timings[i].toString());
      }
      _startTime = _audioContext.currentTime;
      playing = true;
      _endTimer = new Timer(new Duration(milliseconds: duration), _onEnd);
    }
  }

  int getPlaybackPosition(){
    if(!playing){
      return 0;
    }
    return ((_audioContext.currentTime - _startTime)*1000).floor();
  }

  void set onPlaybackEnd(Function callback){
    _endCallback = callback;
  }

}
