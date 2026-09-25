import 'dart:io';

/// Gets the player1 name ash.
String getPlayername(String player) {
  stdout.write("Enter $player name: ");
  String? input = stdin.readLineSync();
  return (input == null || input.trim().isEmpty)
      ? player
      : input.trim();
}

/// Checks if a move is valid.
String? validateMove(String? input, List<String> moves) {
  if (input == null) return null;

  String move = input.trim().toLowerCase();
  return moves.contains(move) ? move : null;
}

/// Gets a valid move from the player.
String getMove(String name, List<String> moves) {
  String? move;

  do {
    stdout.write("$name, enter (rock/paper/scissors): ");
    move = validateMove(stdin.readLineSync(), moves);

    if (move == null) {
      print("Invalid move!");
    }
  } while (move == null);

  return move;
}

/// Decides the winner of the round.
String? decideWinner(String p1, String m1, String p2, String m2) {
  if (m1 == m2) return null;

  if ((m1 == "Rock" && m2 == "Scissors") ||
      (m1 == "Paper" && m2 == "Rock") ||
      (m1 == "Scissors" && m2 == "Paper")) {
    return p1;
  }

  return p2;
}

/// Hides Player2 joy.
void hideMove() {
  for (int i = 0; i < 30; i++) {
    print("");
  }
}

void main() {
  List<String> moves = ["Rock", "Paper", "Scissors"];

  print("===== Rock, Paper, Scissors =====");

  String playerAsh = getPlayername("Player 1");
  String playerJoy = getPlayername("Player 2");

  int scoreOne = 0;
  int scoreTwo = 0;
  String again;

  do {
    String moveOne = getMove(playerAsh, moves);

    hideMove();

    String moveTwo = getMove(playerJoy, moves);

    print("$playerAsh chose $moveOne.");
    print("$playerJoy chose $moveTwo.");

    String? winner = decideWinner(
      playerAsh,
      moveOne,
      playerJoy,
      moveTwo,
    );

    if (winner == playerAsh) {
      scoreOne++;
    } else if (winner == playerJoy) {
      scoreTwo++;
    }

    print("Result: ${winner ?? "Its a draw!"}");
    print("Score -> $playerAsh: $scoreOne | $playerJoy: $scoreTwo");

    stdout.write("Play again? (y/n): ");
    again = stdin.readLineSync()?.trim().toLowerCase() ?? "n";

  } while (again == "y");

  print("\n===== Final Score =====");
  print("$playerAsh: $scoreOne | $playerJoy: $scoreTwo");

  if (scoreOne > scoreTwo) {
    print("Overall winner: $playerAsh");
  } else if (scoreTwo > scoreOne) {
    print("Overall winner: $playerJoy");
  } else {
    print("Overall winner: It's a draw!");
  }
}