class Person
  attr_writer :secret

  def share_secret
    puts secret
  end

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = "Huh? Yeah totally, my password is fat chance bub!"
person1.share_secret
