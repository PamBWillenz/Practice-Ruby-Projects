# frozen_string_literal: true

# rubocop:disable Style/Documentation
module Towable
  def can_tow?(pounds)
    pounds < 2000
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year, :model

  # rubocop:disable Style/ClassVars
  @@number_of_vehicles = 0
  # rubocop:enable Style/ClassVars
  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def self.number_of_vehicles
    puts "Number of vehicles created: #{@@number_of_vehicles}"
  end

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@number_of_vehicles += 1
  end

  def speed_up(num)
    @speed += num
    puts "You are now going #{@speed} mph."
  end

  def brake(num)
    @speed -= num
    puts "You are now going #{@speed} mph."
  end

  def shut_off
    @speed = 0
    puts 'Car is shut off'
  end

  def change_color(c)
    @color = c
    puts "The car color is now #{c}"
  end

  def spray_paint(color)
    self.color = color
    puts "The car color is now #{color}"
  end

  def to_s
    "My vehicle is a #{color}, #{year}, #{@model}!"
  end

  def age
    "Your #{model} is #{years_old} years old."
  end

  private

  def years_old
    Time.now.year - year.to_i
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{color}, #{year}, #{model}!"
  end
end

class MyTruck < Vehicle
  include Towable

  NUMBER_OF_DOORS = 2

  def to_s
    "My truck is a #{color}, #{year}, #{model}!"
  end
end
# rubocop:enable Style/Documentation
car = MyCar.new(2015, 'red', 'Ford')
car.speed_up(20)
car.brake(10)
car.shut_off
car.change_color('blue')
puts car.color
puts car.year
car.spray_paint('green')
MyCar.gas_mileage(10, 300)
puts car

my_car = MyCar.new('2010', 'Ford', 'Focus')
puts my_car

Vehicle.number_of_vehicles
puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors

puts car.age
