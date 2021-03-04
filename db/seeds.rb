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
user_1 = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, specialization: "Orthopaedic",
                      email: "user1@test.com", password: "123456")

user_2 = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, specialization: "Rheumatologist",
                      email: "user2@test.com", password: "123456")

user_3 = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, specialization: "Neurologist",
                      email: "user3@test.com", password: "123456")

user_4 = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, specialization: "Cardiologist",
                      email: "user4@test.com", password: "123456")

# Project
project_1 = Project.create!(name: "test one", description: "This is a test")
project_2 = Project.create!(name: "test two", description: "Second test", completed: true)

# Patient
# patient_1 = Patient.create!(Faker::Name.name, last_name: "Test",
#                             gender: "Male", date_of_birth: "1962-10-10",
#                             address: "123 Fake st, Montreal")
# patient_2 = Patient.create!(first_name: "May", last_name: "Test",
#                             gender: "Female", date_of_birth: "1976-12-10",
#                             address: "456 Fake st, Montreal")

# Case + Patient
case_2 = Case.new(
                  description: "Painless masses in the mouth or face. Respiratory problems",
                  patient_attributes: {
                    first_name: "John",
                    last_name: "Test",
                    gender: "male",
                    date_of_birth: "1962-10-10",
                    address: "123 Fake st, Montreal"
                  }
                )

case_2.user = user_1
case_2.save!

case_3 = Case.new(
                  description: "Painless masses in the mouth or face. Respiratory problems",
                  patient_attributes: {
                    first_name: "John",
                    last_name: "Test",
                    gender: "male",
                    date_of_birth: "1962-10-10",
                    address: "123 Fake st, Montreal"
                  }
                )

case_3.user = user_2
case_3.save!

# Project
project_3 = Project.create!(name: "Adenoid Cystic Carcinoma (ACC)", description: "Adenoid cystic carcinoma (ACC) is a rare form of cancer (adenocarcinoma)
 that most often arises in the salivary glands but may occur in other locations like the breast or uterus.")

link_1 = Link.new
link_1.project = project_3
link_1.case = case_2
link_1.save!

project_4 = Project.create!(name: "Ileostomy (Ulcerative Colitis Surgery)", description: "Ulcerative colitis is a chronic (long-term) inflammatory disease.
  It affects the lining of the large intestine, or colon, and rectum. The rectum is the last section of the colon and is located just above the anus.
  People with ulcerative colitis have tiny ulcers and abscesses in their colon and rectum. These flare up periodically and cause bloody stools and diarrhea.
  Ulcerative colitis may also cause severe abdominal pain and anemia. Anemia is marked by low levels of healthy red blood cells.")

link_2 = Link.new
link_2.project = project_4
link_2.case = case_3
link_2.save!

puts "done seeding..."
