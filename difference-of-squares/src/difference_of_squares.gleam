import gleam/int as i
import gleam/io

// I use an auxiliary function to store the sum and then
// return the square of the sum
fn square_of_sum_helper(i: Int, n: Int, acc: Int) -> Int {
  case i > n {
    True -> acc * acc
    False -> square_of_sum_helper(i + 1, n, acc + i)
  }
}

pub fn square_of_sum(n: Int) -> Int {
  case n {
    0 -> 0

    _ -> square_of_sum_helper(1, n, 0)
  }
}

fn sum_of_squares_helper(i: Int, n: Int, acc: Int) -> Int {
  case i > n {
    True -> acc
    False -> sum_of_squares_helper(i + 1, n, acc + i * i)
  }
}

pub fn sum_of_squares(n: Int) -> Int {
  case n {
    0 -> 0

    _ -> sum_of_squares_helper(1, n, 0)
  }
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
