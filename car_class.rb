class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
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
    puts "Car is shut off"
  end
  def change_color(c)
    @color = c
    puts "The car color is now #{c}"
  end
  def year=(y)
    @year = y
  end
  def spray_paint(color)
    self.color = color
    puts "The car color is now #{color}"
  end
  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
  def to_s 
    "My car is a #{color}, #{year}, #{@model}!"
  end
end

car = MyCar.new(2015, 'red', 'Ford')
car.speed_up(20)
car.brake(10)
car.shut_off
car.change_color('blue')
puts car.color
puts car.year
car.spray_paint('green')
MyCar.gas_mileage(10, 300)
puts car.to_s

my_car = MyCar.new("2010", "Ford", "Focus")
puts my_car