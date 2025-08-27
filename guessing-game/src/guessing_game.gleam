pub fn reply(guess: Int) -> String {
  case guess {
    42 -> "Correct"
    _ ->
      case guess == 41 || guess == 43 {
        True -> "So close"
        False ->
          case guess >= 0 && guess <= 41 {
            True -> "Too low"
            False ->
              case guess >= 43 && guess <= 100 {
                True -> "Too high"
                False -> "Invalid guess"
              }
          }
      }
  }
}
