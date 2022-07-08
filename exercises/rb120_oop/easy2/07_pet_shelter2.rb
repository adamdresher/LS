class Pet
  attr_reader :type, :name
  
  def initialize(type, name)
    @type = type
    @name = name
  end

  def to_s
    "a #{type} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def adopt_pet(pet)
    @pets << pet
  end

  def pets
    @pets
  end

  def number_of_pets
    @pets.size
  end
end

class Shelter
  attr_accessor :owners

  def initialize
    @owners = Hash.new([])
  end

  def adopt(pet, owner='unadopted')
    if owner == 'unadopted'
      owners[owner] += [pet]
    else
      owner.adopt_pet(pet)
      owners[owner.name] = owner.pets
    end
  end

  def print_adoptions
    owners.each_pair do |owner, pets|
      unless owner == 'unadopted'
        puts "#{owner} has adopted the following pets:"
      else
        puts "The Animal Shelter has the following unadopted pets:"
      end
      puts pets
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
asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(butterscotch, phanson)
shelter.adopt(pudding, phanson)
shelter.adopt(darwin, phanson)
shelter.adopt(kennedy, bholmes)
shelter.adopt(sweetie, bholmes)
shelter.adopt(molly, bholmes)
shelter.adopt(chester, bholmes)
shelter.adopt(asta)
shelter.adopt(laddie)
shelter.adopt(fluffy)
shelter.adopt(kat)
shelter.adopt(ben)
shelter.adopt(chatterbox)
shelter.adopt(bluebell)

shelter.print_adoptions
# => 'P Hanson has adopted the following pets:'
# => 'a cat named Butterscotch'
# => 'a cat named Pudding'
# => 'a bearded dragon named Darwin'

# => 'B Holmes has adopted the following pets:'
# => 'a dog named Kennedy'
# => 'a parakeet named Sweetie Pie'
# => 'a dog named Molly'
# => 'a fish named Chester'

# => 'The Animal Shelter has the following unadopted pets:'
# => 'a dog named Asta'
# => 'a dog named Laddie'
# => 'a cat named Fluffy'
# => 'a cat named Kat'
# => 'a cat named Ben'
# => 'a parakeet named Chatterbox'
# => a parakeet named Bluebell'

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# => 'P Hanson has 3 adopted pets.'
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
# => 'B Holmes has 4 adopted pets.'
puts "The Animal Shelter has #{shelter.owners['unadopted'].size} unadopted pets."
# => 'The Animal Shelter has 7 unadopted pets.'
