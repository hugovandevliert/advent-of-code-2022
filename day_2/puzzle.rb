SHAPES = {
  A: :rock,
  B: :paper,
  C: :scissors,
  X: :rock,
  Y: :paper,
  Z: :scissors,
}

OUTCOMES = {
  X: :lose,
  Y: :draw,
  Z: :win,
}

SCORES = {
  rock: 1,
  paper: 2,
  scissors: 3,
}

MOVES = {
  rock: :scissors,
  scissors: :paper,
  paper: :rock,
}

def calculate_score(opponent_move, move)
  outcome = case [opponent_move, move]
    in [a, b] if a == b then 3
    in [:rock, :paper] then 6
    in [:rock, :scissors] then 0
    in [:paper, :scissors] then 6
    in [:paper, :rock] then 0
    in [:scissors, :rock] then 6
    in [:scissors, :paper] then 0
  end

  outcome + SCORES[move]
end

def calculate_move(opponent_move, outcome)
  case outcome
    when :lose then MOVES[opponent_move]
    when :draw then opponent_move
    when :win then MOVES.key(opponent_move)
  end
end

input = File.read('input').split("\n")
scores_1 = input.map(&:split).map { calculate_score(SHAPES[_1.to_sym], SHAPES[_2.to_sym]) }
scores_2 = input.map(&:split).map do |opponent_move, outcome|
  opponent_move = SHAPES[opponent_move.to_sym]
  outcome = OUTCOMES[outcome.to_sym]
  move = calculate_move(opponent_move, outcome)
  calculate_score(opponent_move, move)
end

puts scores_1.sum
puts scores_2.sum
