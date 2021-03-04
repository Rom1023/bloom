# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "destroying records..."

User.destroy_all

puts "start seeding..."

# User
user_1 = User.create!(first_name: "Bob", last_name: "Test", specialization: "Orthopaedic",
                      email: "user1@test.com", password: "123456")
user_2 = User.create!(first_name: "Bob", last_name: "Test", specialization: "Orthopaedic",
                      email: "user2@test.com", password: "123456")

# Project
project_1 = Project.create!(name: "test one", description: "This is a test")
project_2 = Project.create!(name: "test two", description: "Second test", completed: true)

# Patient
# patient_1 = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
#                             gender: Faker::Gender.binary_type, address: Faker::Address.street_address,
#                             date_of_birth: Faker::Date.birthday(min_age: 10, max_age: 65))

# Case + Patient
4.times do
  case_p = Case.new(description: "Leg bones, do not feel normal.",
                  patient_attributes: {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                                       gender: Faker::Gender.binary_type, address: Faker::Address.street_address,
                                       date_of_birth: Faker::Date.birthday(min_age: 10, max_age: 65)})
  case_p.user = user_1
  case_p.save!
end

# case_2 = Case.new(description: "Headache.",
#                   patient_attributes: {first_name: "May", last_name: "Test",
#                                         gender: "Female", date_of_birth: "1976-12-10",
#                                         address: "456 Fake st, Montreal"})
# case_2.user = user_2
# case_2.save!

puts "done seeding..."
