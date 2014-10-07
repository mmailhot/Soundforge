part of soundforge_models;

class AudioContextWrapper {
  static final AudioContext _context = new AudioContext();
  static get context => _context;
}
