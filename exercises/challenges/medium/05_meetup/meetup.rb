class Meetup
  WEEKDAY_NUM =
    { sunday:    0,
      monday:    1,
      tuesday:   2,
      wednesday: 3,
      thursday:  4,
      friday:    5,
      saturday:  6 }

  def initialize(year, month)
    @year = year
    @month = month
    @last_day_in_month = Date.new(year, month, -1).day
  end

  def day(day_of_week, descriptor)
    day_of_week = day_of_week.downcase
    descriptor = descriptor.downcase
    range_of_days = days_of_month(descriptor)
    day_of_month(range_of_days, day_of_week)
  end

  private

  attr_reader :year, :month, :last_day_in_month

  def days_of_month(descriptor)
    case descriptor
    when 'first'  then 1..7
    when 'second' then 8..14
    when 'third'  then 15..21
    when 'fourth' then 22..28
    when 'fifth'  then 29..last_day_in_month
    when 'teenth' then 13..19
    when 'last'   then (last_day_in_month - 6)..last_day_in_month
    end
  end

  def day_of_month(range, day_of_week)
    range.each do |day|
      current_day = Date.new(year, month, day)
      return current_day if current_day.wday == WEEKDAY_NUM[day_of_week.to_sym]
    end
    nil
  end
end
