class Owner
  attr_reader :name, :species
  @@all = []
  def initialize (name = "")
    @name = name
    @@all << self
    @species = "human"
  end

  def say_species
    "I am a #{@species}."
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat (name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    Cat.all.each {|cat| cat.mood = "nervous"}
    Cat.all.each {|cat| cat.owner = nil}
    Dog.all.each {|dog| dog.mood = "nervous"}
    Dog.all.each {|dog| dog.owner = nil}
  end

  def list_pets
    "I have #{ Dog.all.select{ |dog| dog.owner == self }.length} dog(s), and #{ Cat.all.select{ |cat| cat.owner == self }.length} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end


end