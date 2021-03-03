# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroying records..."

User.destroy_all

puts "start seeding..."

# User
user_1 = User.create!(email: "user1@test.com", password: "123456")
user_2 = User.create!(email: "user2@test.com", password: "123456")

# Project
project_1 = Project.create!(name: "test one", description: "This is a test")
project_2 = Project.create!(name: "test two", description: "Second test", completed: true)

# Patient
# patient_1 = Patient.create!(first_name: "John", last_name: "Test",
#                             gender: "Male", date_of_birth: "1962-10-10",
#                             address: "123 Fake st, Montreal")
# patient_2 = Patient.create!(first_name: "May", last_name: "Test",
#                             gender: "Female", date_of_birth: "1976-12-10",
#                             address: "456 Fake st, Montreal")

# Case + Patient
case_1 = Case.new(description: "Leg bones, do not feel normal.",
                  patient_attributes: {first_name: "John", last_name: "Test",
                                        gender: "Male", date_of_birth: "1962-10-10",
                                        address: "123 Fake st, Montreal"})
case_1.user = user_1
case_1.save!

case_2 = Case.new(description: "Headache.",
                  patient_attributes: {first_name: "May", last_name: "Test",
                                        gender: "Female", date_of_birth: "1976-12-10",
                                        address: "456 Fake st, Montreal"})
case_2.user = user_2
case_2.save!

puts "done seeding..."
