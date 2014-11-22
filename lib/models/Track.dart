part of soundforge_models;

@observable
class Track extends Object with Observable{
  List<Clip> clips = toObservable([]);

  Track() {

  }
}
