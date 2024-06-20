# modules
module Towable
  def can_tow?(kg)
    kg < 20000
  end
end

# classes
class Vehicle
  @@number_of_vehicles = 0

  # class methods
  def self.print_number_of_vehicles
    p "Number of vehicles created: #{@@number_of_vehicles}"
  end

  def self.gas_mileage(liters, km)
    p "#{km / liters} km per liters of gas"
  end

  attr_accessor :year, :model, :color, :current_speed

  # instance methods
  def initialize(year, model, color)
    self.year = year
    self.model = model
    self.color = color
    self.current_speed = 0
    @@number_of_vehicles += 1
  end

  def speed_up(number)
    self.current_speed += number
    p "You have accelerated by #{number} km/h"
  end

  def brake(number)
    self.current_speed -= number
    p "You have decelerated by #{number} km/h"
  end

  def print_current_speed
    p "Your current speed is #{self.current_speed} km/h"
  end

  def shut_down
    self.current_speed = 0
    p "You have stopped"
  end

  def spray_paint(color)
    self.color = color
    p "Your new color is #{self.color}"
  end

  def age
    "Your #{self.model} is #{self.years_old} years old"
  end

  private

  def years_old
    Time.now.year - self.year
  end


end

# objects
class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  include Towable
end


puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors
lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_down
MyCar.gas_mileage(13, 351)
lumina.spray_paint("red")
puts lumina
puts lumina.age
