part of soundforge_models;

class FileHolder {
  static AudioFile file = null;
  static void add(AudioFile c){
    file = c;
  }
  static AudioFile get(){
    return file;
  }
  static void remove(){
    file = null;
  }

  FileHolder() {
  }
}
