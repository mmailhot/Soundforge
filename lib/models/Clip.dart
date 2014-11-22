part of soundforge_models;

@observable
class Clip extends Object with Observable{
  AudioFile file;
  @observable int start;
  int start_offset;
  int length;

  Clip(AudioFile audioFile, int startTime) {
    file = audioFile;
    length = (file.buffer.duration * 1000).floor();
    start_offset = 0;
    start = startTime;
  }
}
