class Student < Applicant
  def initialize(name, year)
    super()
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
end

class Applicant
  def initialize(application_num)
    @application_num = application_num
  end
end
