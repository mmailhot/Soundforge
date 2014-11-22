part of soundforge_models;

class ClipHolder {
  static Clip clip = null;
  static void add(Clip c){
    clip = c;
  }
  static Clip get(){
    return clip;
  }
  static void remove(){
    clip = null;
  }

  ClipHolder() {
  }
}
