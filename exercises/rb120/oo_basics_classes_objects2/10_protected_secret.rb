class Person
  attr_writer :secret

  def compare_secret(other_person)
    secret == other_person.secret
  end

  protected
  attr_reader :secret
end

person1 = Person.new
person1.secret = "Huh? Password?? No way, that's ol skool.  I use haikus."

person2 = Person.new
person2.secret = "Idk what a haiku is.  My password is 'hello'.  Is that close?"

puts person1.compare_secret(person2)
