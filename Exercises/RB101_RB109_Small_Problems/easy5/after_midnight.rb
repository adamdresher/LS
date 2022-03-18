def inverse_time(hrs, min)
  unless min == 0
    min = 60 - min
    hrs += 1
  end
  unless hrs == 0
    hrs = 24 - hrs
  end

  [hrs, min]
end

def format_time(hrs, min)
  format("%02d",hrs) + ':' + format("%02d",min)
end

def time_of_day(time)
  sign = time < 0 ? '-' : ''
  hrs, min = time.abs.divmod(60)

  hrs = hrs % 24

  if sign == '-'
    hrs, min = inverse_time(hrs, min)
  end

  format_time(hrs, min)
end

p time_of_day(0)     == "00:00"
p time_of_day(-3)    == "23:57"
p time_of_day(35)    == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000)  == "02:00"
p time_of_day(800)   == "13:20"
p time_of_day(-4231) == "01:29"
