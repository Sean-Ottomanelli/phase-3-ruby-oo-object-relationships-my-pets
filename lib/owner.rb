require "pry"

require_relative "cat.rb"
require_relative "dog.rb"

class Owner

  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def animals
    Cat.all + Dog.all
  end

  def cats
    Cat.all.select do |pet|
      pet.owner == self
    end
  end

  def dogs
    Dog.all.select do |pet|
      pet.owner == self
    end
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each do |pet|
      if pet.owner == self
        pet.mood = "happy"
      end
    end
  end



  def feed_cats
    Cat.all.each do |pet|
      if pet.owner == self
        pet.mood = "happy"
      end
    end
  end

  def sell_pets
    self.animals.each do |pet|
      if pet.owner == self
        pet.mood = "nervous"
        pet.owner = nil
      end
    end
  end

  def list_pets
    
    myDogs = Dog.all.select do |pet|
      pet.owner == self
    end

    myCats = Cat.all.select do |pet|
      pet.owner == self
    end

    "I have #{myDogs.count} dog(s), and #{myCats.count} cat(s)."
    # binding.pry
  end
    # binding.pry

  # code goes here
end

# sean = Owner.new("Sean")
# yosef = Owner.new("Yosef")

# cat1 = Cat.new("Catty", sean)
# cat2 = Cat.new("Kitty", sean)
# cat3 = Cat.new("Cat", yosef)
# cat4 = Cat.new("Kitten", yosef)
# dog1 = Dog.new("Doggy", sean)

#  binding.pry