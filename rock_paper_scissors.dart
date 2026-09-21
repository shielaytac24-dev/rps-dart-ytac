import 'dart:io';

/// Gets the player's name.
String getPlayerName(String player) {
  stdout.write("Enter $player name: ");

  String? input = stdin.readLineSync();
  String name = input?.trim() ?? "";

  if (name.isEmpty) {
    return player;
  }

  return name;
}

/// Checks if the move is valid.
String? validateMove(String? input) {
  if (input == null) {
    return null;
  }

  String move = input.trim().toLowerCase();

  List<String> moves = ["rock", "paper", "scissors"];

  if (moves.contains(move)) {
    return move;
  }

  return null;
}

/// Gets a valid move from the player.
String getMove(String player) {
  while (true) {
    stdout.write("$player, enter your move (rock/paper/scissors): ");

    String? input = stdin.readLineSync();
    String? move = validateMove(input);

    if (move != null) {
      return move;
    }

    print("Invalid move. Please type rock, paper, or scissors.");
  }
}

/// Decides the winner of the round.
String? decideWinner(
    String playerOne,
    String moveOne,
    String playerTwo,
    String moveTwo) {

  if (moveOne == moveTwo) {
    return null;
  }

  switch (moveOne) {
    case "rock":
      if (moveTwo == "scissors") {
        return playerOne;
      } else {
        return playerTwo;
      }

    case "paper":
      if (moveTwo == "rock") {
        return playerOne;
      } else {
        return playerTwo;
      }

    case "scissors":
      if (moveTwo == "paper") {
        return playerOne;
      } else {
        return playerTwo;
      }
  }

  return null;
}

/// Hides Player 1's move.
void hideMove() {
  for (int i = 0; i < 30; i++) {
    print("");
  }
}

void main() {
  print("===== ROCK, PAPER, SCISSORS =====");

  String playerOne = getPlayerName("Player 1");
  String playerTwo = getPlayerName("Player 2");

  int scoreOne = 0;
  int scoreTwo = 0;
  int round = 1;

  String playAgain = "y";

  do {
    print("");
    print("--- Round $round ---");

    String moveOne = getMove(playerOne);

    // Hide Player 1's move
    hideMove();

    String moveTwo = getMove(playerTwo);

    String? winner = decideWinner(
      playerOne,
      moveOne,
      playerTwo,
      moveTwo,
    );

    print("");
    print("$playerOne chose $moveOne.");
    print("$playerTwo chose $moveTwo.");

    if (winner == null) {
      print("Result: It's a draw!");
    } else {
      print("Result: $winner wins the round!");

      if (winner == playerOne) {
        scoreOne++;
      } else {
        scoreTwo++;
      }
    }

    print("Score -> $playerOne: $scoreOne | $playerTwo: $scoreTwo");

    stdout.write("Play again? (y/n): ");

    String? answer = stdin.readLineSync();
    playAgain = answer?.trim().toLowerCase() ?? "n";

    round++;

  } while (playAgain == "y");

  print("");
  print("===== FINAL SCORE =====");
  print("$playerOne: $scoreOne | $playerTwo: $scoreTwo");

  if (scoreOne > scoreTwo) {
    print("Overall winner: $playerOne");
  } else if (scoreTwo > scoreOne) {
    print("Overall winner: $playerTwo");
  } else {
    print("Overall winner: It's a draw!");
  }
}