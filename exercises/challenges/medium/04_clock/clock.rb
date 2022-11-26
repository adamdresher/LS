class Clock
  include Comparable

  HRS_IN_DAY = 24
  MIN_IN_HR = 60
  MIN_IN_DAY = MIN_IN_HR * HRS_IN_DAY

  def self.at(hour, minutes=0)
    new(hour, minutes)
  end

  def to_s
    format('%02d:%02d', hour, minutes)
  end

  def +(min)
    plus_hr, plus_min = hrs_and_min(min)
    new_hr = hour + plus_hr
    new_min = minutes + plus_min

    if new_min > MIN_IN_HR
      new_min -= MIN_IN_HR
      new_hr += 1
    end
    new_hr -= HRS_IN_DAY if new_hr >= HRS_IN_DAY

    Clock.new(new_hr, new_min)
  end

  def -(min)
    minus_hr, minus_min = hrs_and_min(min)
    new_hr = hour - minus_hr
    new_min = minutes - minus_min

    if new_min < 0
      new_min += MIN_IN_HR
      new_hr -= 1
    end
    new_hr += HRS_IN_DAY if new_hr < 0

    Clock.new(new_hr, new_min)
  end

  private

  attr_accessor :hour, :minutes

  def initialize(hour, minutes)
    @hour = hour
    @minutes = minutes
  end

  def hrs_and_min(minutes)
    less_than_a_day = minutes.divmod(MIN_IN_DAY).last
    less_than_a_day.divmod(60)
  end

  def <=>(other)
    to_s <=> other.to_s
  end
end
