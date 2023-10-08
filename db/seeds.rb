# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

airport_codes = %w[ATL DFW DEN ORD DXB LAX
                   IST LHR DEL CDG JFK LAS]

airport_codes.each do |c|
  Airport.create!({ code: c })
end

p "Created #{airport_codes.length} airports"

random_flights_amount = 10

random_flights_amount.times do
  depart, arrive = airport_codes.sample(2)
  # + 1 since database IDs start at 1
  depart_id = airport_codes.index(depart) + 1
  arrive_id = airport_codes.index(arrive) + 1
  # puts "departing from: #{depart}, #{depart_id} arriving to: #{arrive}, #{arrive_id}"
  Flight.create!({ start: DateTime.now + rand(2..60), flight_duration: rand(120..1440),
                   departure_airport_id: depart_id, arrival_airport_id: arrive_id })
end

p "Created #{random_flights_amount} flights"
