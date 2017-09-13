# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Owner.delete_all
Restaurant.delete_all
Reservation.delete_all


User.create(first_name: "Marlon", last_name: "O'Neil", email: "marlon.oneil@email.com", password: "password", phone: "55512345678", city: "Ottawa", province: "Ontario")

User.create(first_name: "Kaiser", last_name: "Chan", email: "kaiser.chan@email.com", password: "password", phone: "5559876543", city: "Toronto", province: "Ontario")

Owner.create(name: "Marius Butuc", email: "marius@owners.com", password: "password")

Owner.first.restaurants.create(name: "Marius' Delight", summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", street_address: "165 Legion Rd N", city: "Etobicoke", province: "Ontario", postal_code: "M8Y 0B3", phone: "1112345678", max_capacity: 100, opening_time: Time.parse("6AM"), closing_time: Time.parse("8PM") )

restaurant = Restaurant.last

restaurant.reservations.create(reservation_date: Date.current + 1.day, reservation_time: Time.parse("5PM"), party_size: 10, user_id: User.first)
