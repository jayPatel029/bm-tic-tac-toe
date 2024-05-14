
import 'package:tic_tac_toe/computer/computer.dart';

class Utils {
  static bool isBoardFull(List<int> board) {
    return board.every((val) => val != Comp.EMPTY_SPACE);
  }

  static bool isMoveLegal(List<int> board, int move) {
    return move >= 0 && move < board.length && board[move] == Comp.EMPTY_SPACE;
  }

  static int evaluateBoard(List<int> board) {
    for (var list in Comp.WIN_CONDITIONS_LIST) {
      if (board[list[0]] != Comp.EMPTY_SPACE &&
          board[list[0]] == board[list[1]] &&
          board[list[0]] == board[list[2]]) {
        return board[list[0]];
      }
    }

    return isBoardFull(board) ? Comp.DRAW : Comp.NO_WINNERS_YET;
  }

  static int flipPlayer(int currentPlayer) {
    return -currentPlayer;
  }
}
