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

Owner.first.restaurants.create(name: "Marius' Delight", summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", street_address: "165 Legion Rd N", city: "Etobicoke", province: "Ontario", postal_code: "M8Y 0B3", phone: "1112345678", max_capacity: 100, opening_time: 8, closing_time: 20)

Owner.first.restaurants.create(name: "Marius' Second Delight", summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", street_address: "165 Legion Rd N", city: "Ottawa", province: "Ontario", postal_code: "M8Y 0B3", phone: "9991239991", max_capacity: 100, opening_time: 9, closing_time: 21)

restaurant = Restaurant.last

restaurant.reservations.create(reservation_date: Date.current + 1.day, reservation_time: 8, party_size: 10, user_id: User.first)

restaurant.reservations.create(reservation_date: Date.current + 2.day, reservation_time: 10, party_size: 10, user_id: User.first)

restaurant.reservations.create(reservation_date: Date.current + 3.day, reservation_time: 12, party_size: 10, user_id: User.first)

restaurant.reservations.create(reservation_date: Date.current + 4.day, reservation_time: 14, party_size: 10, user_id: User.first)
