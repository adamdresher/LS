class Robot
  @@name_database = []
  attr_reader :name

  def initialize
    self.name = reset
  end

  def reset
    loop do
      self.name = generate_name
      next if name_exists_in_database?
      @@name_database << name
      break
    end
    @name
  end

  private

  attr_writer :name

  def generate_name
    new_name = ''
    2.times { new_name << ('A'..'Z').to_a.sample }
    3.times { new_name << ('0'..'9').to_a.sample }
    new_name
  end

  # # alternative may be less predictable
  # # rubocop:disable Layout/IndentationConsistency
  # def generate_name
  #   new_name = ''
  #   2.times { new_name << rand(65..90).chr }
  #             new_name << rand(999).to_s
  #   new_name
  # end
  # # rubocop:enable Layout/IndentationConsistency

  def name_exists_in_database?
    @@name_database.include? name
  end
end
