DEGREE = "\xC2\xB0"

def split_angle(dividend)
  quotient, remainder = dividend.divmod(1)
  [quotient, remainder]
end

def format_num(integer)
  format("%02d", integer)
end

def dms(angle)
  num_degree, num_min = split_angle(angle)
  num_min *= 60
  num_min, num_sec = split_angle(num_min)
  num_sec *= 60
  if num_sec.round(half: :up) == 60
    num_min += 1
    num_sec = 0
  end

  num_min = format_num(num_min)
  num_sec = format_num(num_sec)

  "#{num_degree}#{DEGREE}#{num_min}'#{num_sec}\""
end
