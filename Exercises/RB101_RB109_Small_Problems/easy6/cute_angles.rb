DEGREE = "\xC2\xB0"

def split_angle(dividend)
  quotient, remainder = dividend.divmod(1)
  [quotient, remainder]
end

def dms(float_angle)
  degrees, minutes = split_angle(float_angle % 360)
  minutes *= 60
  minutes, seconds = split_angle(minutes)
  seconds *= 60
  if seconds.round(half: :up) == 60
    minutes += 1
    seconds = 0
  end

  format(%(%d#{DEGREE}%02d'%02d"), degrees, minutes, seconds)
end
