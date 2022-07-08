class Pet
  attr_reader :type, :name
  
  def initialize(type, name)
    @type = type
    @name = name
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = 0
  end

  def inspect
    @pets += 1
    name
  end

  def number_of_pets
    @pets
  end
end

class Shelter
  attr_accessor :owners

  def initialize
    @owners = Hash.new([])
  end

  def adopt(owner, pet)
    owner.inspect
    owners[owner] += [pet]
  end

  def print_adoptions
    owners.each_pair do |owner, pets|
      puts "#{owner.name} has adopted the following pets:"
      pets.each { |animal| puts "a #{animal.type} named #{animal.name}" }
      puts
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
# => P Hanson has adopted the following pets:
# => a cat named Butterscotch
# => a cat named Pudding
# => a bearded dragon named Darwin

# => B Holmes has adopted the following pets:
# => a dog named Kennedy
# => a parakeet named Sweetie Pie
# => a dog named Molly
# => a fish named Chester

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# => 'P Hanson has 3 adopted pets.'
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
# => 'B Holmes has 4 adopted pets.'
