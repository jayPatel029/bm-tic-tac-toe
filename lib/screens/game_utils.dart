
import '../computer/computer.dart';
import '../utils/utils.dart';

class GameUtils {
  final void Function(int idx) showMoveOnUi;
  final void Function(int winningPlayer) showGameEnd;

  final Comp _aiPlayer;

  GameUtils(this.showMoveOnUi, this.showGameEnd) : _aiPlayer = Comp();

  void onHumanPlayed(List<int> board) async {
    int evaluation = Utils.evaluateBoard(board);
    if (evaluation != Comp.NO_WINNERS_YET) {
      onGameEnd(evaluation);
      return;
    }

    int aiMove = await _getAiMove(board);
    board[aiMove] = Comp.AI_PLAYER;

    evaluation = Utils.evaluateBoard(board);
    if (evaluation != Comp.NO_WINNERS_YET)
      onGameEnd(evaluation);
    else
      showMoveOnUi(aiMove);
  }

  Future<int> _getAiMove(List<int> board) async {
    return await Future(() => _aiPlayer.play(board, Comp.AI_PLAYER));
  }

  void onGameEnd(int winner) {
    showGameEnd(winner);
  }
}
