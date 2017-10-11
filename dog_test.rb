require 'minitest/autorun'
require_relative 'dog'
require_relative 'animal'

class DogTest < MiniTest::Test
  def setup
  @animal = Animal.new()
  @dog = Dog.new("Max")  
  end

  def test_if_Dog_Class_inherits_from_Animal_Class
    assert_equal Animal, Dog.superclass
  end

  def test_if_dog_object_is_instance_of_Dog
    assert_instance_of Dog, @dog
  end

  def test_dog_initalize_with_one_argument
    assert_equal @dog.name, "Max"
    assert_equal @dog.species, "Dog"
    assert_equal 0, @dog.speed
    assert_equal 0, @dog.legs
  end

  def test_if_name_is_an_accessible_property
    @dog.name = "Dog Name"
    assert_match @dog.name, "Dog Name"
  end

  def test_if_species_is_a_dog
    assert_match @dog.species, "Dog"  
  end
  
  def test_if_speed_is_an_accessible_property
    @dog.speed = 12
    assert_equal @dog.speed, 12
  end
  
  def test_if_legs_is_an_accessible_property
    @dog.legs = 4
    assert_equal @dog.legs, 4
  end

  def test_if_name_is_a_string
    assert_instance_of String, @dog.name
  end

  def test_if_species_is_a_string
    assert_instance_of String, @dog.species 
  end

  def test_if_speed_is_a_number
    @dog.speed = 101
    assert_instance_of Integer, @dog.speed
    @dog.speed = 20.123
    assert_instance_of Float, @dog.speed
  end

  def test_if_legs_is_a_number
    @dog.legs = 101
    assert_instance_of Integer, @dog.legs
    @dog.legs = 2.5
    assert_instance_of Float, @dog.legs
  end

  def test_walk_when_legs_is_zero
    assert_raises TypeError do
      @dog.walk
    end
  end

  def test_walk_when_legs_greater_than_zero
    @dog.legs = 4
    current_speed = @dog.speed
    @dog.walk
    assert_equal (current_speed + (0.2 * @dog.legs)), @dog.speed
  end

  def test_if_to_s_method_puts_name_and_species
    assert_equal "#{@dog.name} is a #{@dog.species}", @dog.to_s
  end

end