require_relative 'animal'
require_relative 'dog_test'
class Dog < Animal
  
  def initialize(name)
    super(name, "Dog") #calls Animal's initialize
  end
  
  # Sets the speed of the dog
  def walk
    if @legs > 0
      @speed = @speed + (0.2 * @legs)
    else
      raise TypeError, 'Legs property must contain a number greater than 0'
    end
  end
end