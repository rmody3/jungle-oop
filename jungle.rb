#Notes:
  # Animal is the Super Class
  # Tiger and Monkey Inherit From Animal
  # There are definetely some areas of making it more dry, especially with checking for energy levels


class Animal
  attr_reader :energy
  @@all_animals = []

  def initialize(energy=0)
    @energy = energy
    @@all_animals << self
  end

  def make_sound
    has_energy?(-3) {puts("made a sound")}
  end

  def eat_food(food)
    in_jungle?(food) {@energy +=5}
  end

  def sleep
    puts("went to sleep")
    @energy += 10
  end

  def self.all
    @@all_animals
  end

  private

  def has_energy?(change_to_energy)
    reduced_energy = @energy + change_to_energy
    if reduced_energy >=0
      @energy = reduced_energy
      yield
    else
      puts("not enough energy")
    end
  end

  def in_jungle?(food)
    if Jungle::FOOD.include?(food)
      puts("ate #{food}")
      yield
    else
      puts("#{food} doesn't exist in the jungle")
    end
  end


end

class Tiger < Animal

  @@all_tigers = []

  def initialize(energy=0)
    super(energy)
    @@all_tigers << self
  end

  def sleep
    puts("went to sleep")
    @energy +=5
  end

  def eat_food(food)
    if food != "grain"
      super(food)
    else
      puts("cannot eat grain")
    end
  end

  def self.all
    @@all_tigers
  end

end

class Monkey < Animal
  @@all_monkeys = []

  def initialize(energy=0)
    super(energy)
    @@all_monkeys << self
  end

  def eat_food(food)
    in_jungle?(food) {@energy +=2}
  end

  def make_sound
    has_energy?(-4) {puts("made a sound")}
  end

  def play
    reduced_energy = @energy - 8
    if reduced_energy >=0
      puts("Oooo Oooo Oooo")
      @energy = reduced_energy
    else
      puts("Monkey is too tired")
    end
  end

  def self.all
    @@all_monkeys
  end

end

class Jungle
  FOOD = ["meat", "bugs", "fish", "grain"]
  def self.sound_off
    Animal.all.each do |animal|
      animal.make_sound
      puts(animal.energy)
    end
  end
end

# Quick Tests
newAnimal = Tiger.new()
newAnimal2 = Monkey.new()
newAnimal.sleep
puts(newAnimal.energy)
newAnimal.make_sound
newAnimal.eat_food("cheese")
newAnimal.eat_food("grain")
newAnimal.eat_food("meat")
puts(newAnimal.energy)
newAnimal2.eat_food("grain")
newAnimal2.eat_food("grain")
newAnimal2.eat_food("grain")
newAnimal2.eat_food("grain")
newAnimal2.play
newAnimal.make_sound
puts(newAnimal.energy)
puts(Tiger.all.count)
puts(Animal.all.count)
Jungle.sound_off

#Outline of prompt Notes
# class jungle
#   - make sound off of all animals
#   - contains, meat, fish, bugs, grain
#   - perform a random activity -->
#
#
# class animal
#   - methods: make sound, eat food, sleep
#     - make sound: reduce energy level by 3
#     - eating food: increase energy level by 5
#     - sleeping: increase energy by 10
#   - has energy level
#   - some animals can play?
#   - knows how many total animals exist -->
#
# class tiger < animal
#   - method: sleeping, eating
#     - sleepin: increases by 5
#     - eating: cannot eat grain
#
# class Monkey < animal
#   - method: eating, making a sound, play

#     - eating: increase energy by 2
#     - make sound: reduce energy by 4
#   - play: if energy say "Oooo Oooo Oooo" and get -8 energy else "Monkey is too tired"
