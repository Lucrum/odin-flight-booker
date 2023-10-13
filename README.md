# odin-flight-booker

This project is from The Odin Project's Ruby on Rails [curriculum](https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker).

A Ruby on Rails based one-way flight booker web application, featuring nested forms and a seeded database.

This project allows users to search for a one-way flight given a departure airport, arrival airport, date, and number of passengers. The user may then book their desired flight, completing a form to fill out passenger information.

Passengers will also receive a booking confirmation e-mail upon successful booking.

# usage

1. To run, download this repository and navigate into the folder. Run `bundle install` to install any necessary gems.

2. Run `rake db:seed` to seed the database with 100 random flights.

3. Finally, run `bin/rails s` and head to http://127.0.0.1:3000.