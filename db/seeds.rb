# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Project
project_1 = Project.create!(name: "test one", description: "This is a test")
project_2 = Project.create!(name: "test two", description: "Second test", completed: true)

# Patient
patient_1 = Patient.create!(first_name: "John", last_name: "Test",
                            gender: "Male", date_of_birth: "1962-10-10",
                            address: "123 Fake st, Montreal")
patient_2 = Patient.create!(first_name: "May", last_name: "Test",
                            gender: "Female", date_of_birth: "1976-12-10",
                            address: "456 Fake st, Montreal")
