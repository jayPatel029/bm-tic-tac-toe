class HomeUtils {
  int _playerCount = 0;


  void recordVictory() {
    _playerCount++;
  }

  int getVictoryCount() => _playerCount;
}
