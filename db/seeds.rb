# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
  { name: 'User 1', email: 'user1@gmail.com', password: 'password123'},
  { name: 'User 2', email: 'user2@gmail.com', password: 'password234'},
  { name: 'User 3', email: 'user3@gmail.com', password: 'password345'}
])