class Customer
  attr_accessor :name, :contact
  def initialize(name, contact)
    @name = name
    @contact = contact
  end
end

class Vehicle
  attr_accessor :id, :available
  @@vehicle_count = 0
  @@available = 0

  def initialize(vehicle_id)
    @id = vehicle_id
    @available = true
    self.class.increment_vehicle_count
    self.class.increment_available_vehicle
  end

  def self.increment_available_vehicle
    @@available += 1
  end

  def self.increment_vehicle_count
    @@vehicle_count += 1
  end

  def self.total_vehicles
    @@vehicle_count
  end
end

class Bike < Vehicle
  attr_accessor :model
  @bike_count = 0

  def initialize(model)
    @model = model
    super(self)
    self.class.increment_bike_count
  end

  def self.increment_bike_count
    @bike_count += 1
  end

  def self.total_bikes
    @bike_count
  end
end

class Car < Vehicle
  attr_accessor :model
  @car_count = 0

  def initialize(model)
    super(self)
    @model = model
    self.class.increment_car_count
  end

  def self.increment_car_count
    @car_count += 1
  end

  def self.total_cars
    @car_count
  end
end

class Rentals
  attr_accessor :customer, :vehicle, :duration, :rental_rate
  BIKE_RATE = 100
  CAR_RATE = 500

  def initialize(customer, vehicle, duration)
    raise "Vehicle not available" unless vehicle.available
    @customer = customer
    @vehicle = vehicle
    @duration = duration
    @rental_rate = calculate_rate
    vehicle.available = false
  end

  def calculate_rate
    base_rate = case vehicle
                when Bike then BIKE_RATE
                when Car  then CAR_RATE
                end
    base_rate * duration
  end

  def return_vehicle
    vehicle.available = true
    "Vehicle #{vehicle.id} returned successfully!"
  end
end

customer1 = Customer.new("Adarsh Amit", "9546859822")
bike1 = Bike.new("MountainBike")
car1 = Car.new("Audi")

rental1 = Rentals.new(customer1, bike1, 3)
rental2 = Rentals.new(customer1, bike1, 3)

puts "Rental cost: #{rental1.rental_rate}"
puts rental1.return_vehicle

puts "Total vehicles: #{Vehicle.total_vehicles}"
puts "Total bikes: #{Bike.total_bikes}"
puts "Total cars: #{Car.total_cars}"
