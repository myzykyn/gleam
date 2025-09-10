import gleam/string

pub fn message(log_line: String) -> String {
  let result_message = string.crop(log_line, before: ":")
  let result = string.drop_start(result_message, up_to: 2)
  string.trim(result)
}

pub fn log_level(log_line: String) -> String {
  let result_message = string.split_once(log_line, on: ":")
  let log_part = case result_message {
    Ok(#(first, _rest)) -> first
    Error(_) -> ""
  }
  let result_1 = string.drop_start(log_part, up_to: 1)
  let result_2 = string.drop_end(result_1, up_to: 1)
  string.lowercase(result_2)
}

pub fn reformat(log_line: String) -> String {
  let result_message = string.split_once(log_line, on: ":")
  let reformated = case result_message {
    Ok(#(first, second)) -> {
      let part1 = string.trim(second)
      let part2 = string.trim(first)
      let result_1 = string.drop_start(part2, up_to: 1)
      let result_2 = string.drop_end(result_1, up_to: 1)

      string.concat([part1, " (", string.lowercase(result_2), ")"])
    }
    Error(_) -> ""
  }
  reformated
}
