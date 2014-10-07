part of soundforge_models;

//Do not actually use, mainly a reference implementation
abstract class AudioFile {
  Future load();

  AudioBuffer get buffer;
  String get name;
}