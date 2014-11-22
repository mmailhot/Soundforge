part of soundforge_models;

class Utils {
  static String formatTimeCode(int ms){
    int milliseconds = ms % 1000;
    int seconds = ((ms - milliseconds) % 60000) / 1000;
    int minutes = (ms - milliseconds - (seconds*1000))/60000;

    return minutes.floor().toString().padLeft(2, "0") + ":" + seconds.floor().toString().padLeft(2, "0") + ":" + milliseconds.floor().toString().padLeft(3,"0");
  }
  Project() {

  }
}
