def get_grade(score1, score2, score3)
  grade_scores = {
    100..   => 'A+',
    90..100 => 'A',
    80...90 => 'B',
    70...80 => 'C',
    60...70 => 'D',
    0...60  => 'F'
  }

  score = [score1, score2, score3].sum / 3

  grade_scores.each do |k, v|
    return v if k.include? score
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(100, 110, 195) == 'A+'
