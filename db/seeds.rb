require 'faker'
require "open-uri"


puts "start seeding..."

doctor_house = User.create!(first_name: "Gregory", last_name: "House",
                      specialization: "Cardiologist", email: "gregoryhouse@bloom.com", password: "123456")
doctor_house.avatar.attach(io: File.open("app/assets/images/avatars/dr-m-3.png"), filename: "dr-m-3.png", content_type: "image/png")


# # == fill the space data: User, Case, Patient, Project, Link, Collaboration, Comment ==
specializations = ["Psychiatry", "Rheumatologist", "Neurologist", "Gynaecologist",
                   "Cardiologist", "Oncologist", "Urologist", "Gastroenterologist"]
case_descriptions = ["Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget
              dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes,
              nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis,
              em. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec,
              vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.
              Nullamo dictum felis eu pede lismos pretium. Integer tincidunt. Cras dapibus. Vivamus
              elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu,
              onsequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat
              a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrumt. Aenean
              imperdiet. Etiam ultricies nisi vel augue. Curabiture ullamcorper ultricies nisi."]
case_titles = ["Curabiture at lacus (blocked blood vessels)", "Pellentesque rutrumt(inflammation)",
              "Varius tincidunt", "Nullamos quis antef"]
project_names = ["Felis eu depe mollis prutism", "Pellentfsesque eu prefatium",
                "Viverra qusis fegiat", "ultrifcies mid eu turpids hendfrerit",
                "Etiavm impdiet imposerdiet orc", "Consectetuer lacinia nam pretfaium", "STEMI heart attack",
                "Prinzmetal angina", "Barlow’s syndrome", "Ebstein’s anomaly" ]
project_descriptions = ["Lorem ipsum vestibulum purus quam, scelerisque ut, mslios sed, nonummy id, metus.
                      Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla.
                      Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia
                      Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu. Duis arcu
                      tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Sed aliquam ultrices
                      mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent
                      adipiscing. Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Phasellus
                      viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam
                      ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam
                      rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero."]
comments = ["Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,
            quis gravida magna mi a libero. Fusce vulputate eleifend sapien. Vestibulum purus quam, scelerisque.",
            "Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis.",
            "Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget
            condimentum rhoncus, sem quam semper libero.", "Imperdiet feugiat, pede. Sed lectus. Donec mollis
            hendrerit risus. Phasellus nec sem in justo pellentesque facilisis. Etiam imperdiet imperdiet orci.",
            "Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus."]
avatars = [ { io: File.open("app/assets/images/avatars/dr-f-1.jpg"), filename: "dr-f-1.jpg", content_type: "image/jpg"},
            { io: File.open("app/assets/images/avatars/dr-f-2.jpg"), filename: "dr-f-2.jpg", content_type: "image/jpg"},
            { io: File.open("app/assets/images/avatars/dr-f-3.png"), filename: "dr-f-3.png", content_type: "image/png"},
            { io: File.open("app/assets/images/avatars/dr-f-4.png"), filename: "dr-f-4.png", content_type: "image/png"},
            { io: File.open("app/assets/images/avatars/dr-m-1.jpg"), filename: "dr-m-1.jpg", content_type: "image/jpg"},
            { io: File.open("app/assets/images/avatars/dr-m-2.jpg"), filename: "dr-m-2.jpg", content_type: "image/jpg"},
            { io: File.open("app/assets/images/avatars/dr-m-3.png"), filename: "dr-m-3.png", content_type: "image/png"},
            { io: File.open("app/assets/images/avatars/dr-m-4.png"), filename: "dr-m-4.png", content_type: "image/png"},
          ]

counter = 0
8.times do
  # User
  puts "user creating #{counter}"
  user_sample = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
               specialization: specializations.sample, email: Faker::Internet.email, password: "123456")
  avatar_pick = avatars[counter]
  user_sample.avatar.attach(io: avatar_pick[:io], filename: avatar_pick[:filename], content_type: avatar_pick[:content_type])

  # Case
  rand(3..6).times do
    case_sample = Case.new(description: case_descriptions.sample, title: case_titles.sample,
                 patient_attributes: {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                                      gender: ["female", "male"].sample, address: Faker::Address.street_address,
                                      date_of_birth: Faker::Date.birthday(min_age: 10, max_age: 65)})
    case_sample.user = user_sample
    case_sample.save!
  end
  # Project
  puts "project creating #{counter}"

  rand(2..4).times do
    project_sample = Project.create!(name: project_names.sample, description: project_descriptions.sample)
    # Collaboratiob (admin)
    collaboration_sample = Collaboration.new
    collaboration_sample.project = project_sample
    collaboration_sample.user = user_sample
    collaboration_sample.role = 'admin'
    collaboration_sample.save!
    # Link
    rand(4..6).times do
      link_sample = Link.new
      link_sample.project = project_sample
      link_sample.case = Case.all.sample
      link_sample.save!
    end
    # Collaboration (collaborators)
    rand(4..7).times do
      collaboration_sample = Collaboration.new
      collaboration_sample.project = project_sample
      collaboration_sample.user = User.where.not(id: user_sample.id).sample
      collaboration_sample.role = 'collaborator'
      collaboration_sample.save!
    end
    #Comments
    rand(5..8).times do
      comment_sample = Comment.new(content: comments.sample)
      comment_sample.user = User.all.sample
      comment_sample.project = project_sample
      comment_sample.save!
    end
  end
  counter += 1

end
# =====

# -------- Pitch Dr. Green (offer help) -----------
cardiologist = []
cardiologist << "Heart and blood vessel disease (also called heart disease) includes numerous problems,
                many of which are related to a process called atherosclerosis. A special catheter (long
                hollow tube) is inserted into the coronary artery to be treated. This catheter has a tiny
                balloon at its tip. The balloon is inflated once the catheter has been placed into the
                narrowed area of the coronary artery.Atherosclerosis is a condition that develops when
                a substance called plaque builds up in the walls of the arteries. This buildup narrows
                the arteries, making it harder for blood to flow through. If a blood clot forms, it can
                block the blood flow. This can cause a heart attack or stroke."
cardiologist << "A buildup of fatty plaques in your arteries, or atherosclerosis (ath-ur-o-skluh-ROE-sis) can
                damage your blood vessels and heart. Plaque buildup causes narrowed or blocked blood vessels
                that can lead to a heart attack, chest pain (angina) or stroke. Coronary artery disease symptoms
                may be different for men and women. For instance, men are more likely to have chest pain. Women
                are more likely to have other signs and symptoms along with chest discomfort, such as shortness
                of breath, nausea and extreme fatigue. Signs and symptoms can include: Chest pain, chest
                tightness, chest pressure and chest discomfort (angina). Shortness of breath. Pain, numbness,
                weakness or coldness in your legs or arms if the blood vessels in those parts of your body
                are narrowed. Pain in the neck, jaw, throat, upper abdomen or back"

# -- Dr Green --
doctor_green = User.create!(first_name: "Judy", last_name: "Green",
                      specialization: "Cardiologist", email: "judygreen@bloom.com", password: "123456")
doctor_green.avatar.attach(io: File.open("app/assets/images/avatars/dr-green.png"), filename: "dr-green.png", content_type: "image/png")

john = Patient.new(first_name: "John", last_name: "Smith",
            gender: "male", address: Faker::Address.street_address,
            date_of_birth: "1952-03-28")
john.medications.attach(io: File.open("app/assets/images/dr_green/medication-1.png"), filename: "medication-1.png", content_type: "image/png")
john.treatments.attach(io: File.open("app/assets/images/dr_green/treatment-2-baloon.jpg"), filename: "treatment-1-baloon.jpg", content_type: "image/jpg")
john.treatments.attach(io: File.open("app/assets/images/dr_green/treatment-1-surgery.jpg"), filename: "treatment-1-surgery.jpg", content_type: "image/jpg")
john.surgeries.attach(io: File.open("app/assets/images/dr_green/treatment-1-surgery.jpg"), filename: "treatment-1-surgery.jpg", content_type: "image/jpg")
john.surgeries.attach(io: File.open("app/assets/images/dr_green/x-ray-1.jpg"), filename: "x-ray-1.jpg", content_type: "image/jpg")
john.surgeries.attach(io: File.open("app/assets/images/dr_green/x-ray-2.jpg"), filename: "x-ray-2.jpg", content_type: "image/jpg")
john.surgeries.attach(io: File.open("app/assets/images/dr_green/electrocardiogram-1.png"), filename: "electrocardiogram-1.png", content_type: "image/png")
john.surgeries.attach(io: File.open("app/assets/images/dr_green/electrocardiogram-2.png"), filename: "electrocardiogram-2.png", content_type: "image/png")
john.lab_tests.attach(io: File.open("app/assets/images/dr_green/labtest-1.jpeg"), filename: "labtest-1.jpeg", content_type: "image/jpeg")
john.lab_tests.attach(io: File.open("app/assets/images/dr_green/labtest-2.png"), filename: "labtest-1.png", content_type: "image/png")
john.lab_tests.attach(io: File.open("app/assets/images/dr_green/blood-test-1.png"), filename: "blood-test-1.png", content_type: "image/png")
john.genetic_results.attach(io: File.open("app/assets/images/dr_green/genetic-report-1.png"), filename: "genetic-report-1.png", content_type: "image/png")
john.allergies.attach(io: File.open("app/assets/images/dr_green/allergy-test-1.jpg"), filename: "allergy-test-1.jpg", content_type: "image/jpg")
john.save!
case_john = Case.new(description: cardiologist[0],
                     title: "Balloon Angioplasty")
case_john.patient = john
case_john.user = doctor_green
case_john.save!
# -- Dr House --
# doctor_house = User.create!(first_name: "Gregory", last_name: "House",
#                       specialization: "Cardiologist", email: "gregoryhouse@bloom.com", password: "123456")
# doctor_house.avatar.attach(io: File.open("app/assets/images/avatars/dr-m-3.png"), filename: "dr-m-3.png", content_type: "image/png")

may = Patient.new(first_name: "May", last_name: "Lee",
            gender: "male", address: Faker::Address.street_address,
            date_of_birth: "1980-09-02")
may.medications.attach(io: File.open("app/assets/images/dr_green/medication-1.png"), filename: "medication-1.png", content_type: "image/png")
may.treatments.attach(io: File.open("app/assets/images/dr_green/treatment-2-baloon.jpg"), filename: "treatment-2-baloon.jpg", content_type: "image/jpg")
may.treatments.attach(io: File.open("app/assets/images/dr_green/treatment-1-surgery.jpg"), filename: "treatment-1-surgery.jpg", content_type: "image/jpg")
may.surgeries.attach(io: File.open("app/assets/images/dr_green/treatment-3-laser.jpg"), filename: "treatment-3-laser.jpg", content_type: "image/jpg")
may.surgeries.attach(io: File.open("app/assets/images/dr_green/x-ray-1.jpg"), filename: "x-ray-1.jpg", content_type: "image/jpg")
may.surgeries.attach(io: File.open("app/assets/images/dr_green/x-ray-2.jpg"), filename: "x-ray-2.jpg", content_type: "image/jpg")
may.surgeries.attach(io: File.open("app/assets/images/dr_green/electrocardiogram-1.png"), filename: "electrocardiogram-1.png", content_type: "image/png")
may.surgeries.attach(io: File.open("app/assets/images/dr_green/electrocardiogram-2.png"), filename: "electrocardiogram-2.png", content_type: "image/png")
may.lab_tests.attach(io: File.open("app/assets/images/dr_green/labtest-1.jpeg"), filename: "labtest-1.jpeg", content_type: "image/jpeg")
may.lab_tests.attach(io: File.open("app/assets/images/dr_green/labtest-2.png"), filename: "labtest-2.png", content_type: "image/png")
may.lab_tests.attach(io: File.open("app/assets/images/dr_green/blood-test-1.png"), filename: "blood-test-1.png", content_type: "image/png")
may.genetic_results.attach(io: File.open("app/assets/images/dr_green/genetic-report-1.png"), filename: "genetic-report-1.png", content_type: "image/png")
may.allergies.attach(io: File.open("app/assets/images/dr_green/allergy-test-1.jpg"), filename: "allergy-test-1.jpg", content_type: "image/jpg")
may.save!
case_may = Case.new(description: cardiologist[1],
                     title: "Laser Angioplasty")
case_may.patient = may
case_may.user = doctor_house
case_may.save!
# -- Dr Gasparindo --
doctor_leo = User.create!(first_name: "Leo", last_name: "Gasparindo",
                      specialization: "Cardiologist", email: "leogasparindo@bloom.com", password: "123456")
doctor_leo.avatar.attach(io: File.open("app/assets/images/avatars/dr-m-1.jpg"), filename: "dr-m-1.jpg", content_type: "image/jpg")

bob = Patient.new(first_name: "Bob", last_name: "Miller",
            gender: "male", address: Faker::Address.street_address,
            date_of_birth: "1966-10-21")
bob.medications.attach(io: File.open("app/assets/images/dr_green/medication-1.png"), filename: "medication-1.png", content_type: "image/png")
bob.treatments.attach(io: File.open("app/assets/images/dr_green/treatment-2-baloon.jpg"), filename: "treatment-2-baloon.jpg", content_type: "image/jpg")
bob.treatments.attach(io: File.open("app/assets/images/dr_green/treatment-3-laser.jpg"), filename: "treatment-3-laser.jpg", content_type: "image/jpg")
bob.surgeries.attach(io: File.open("app/assets/images/dr_green/treatment-1-surgery.jpg"), filename: "treatment-1-surgery.jpg", content_type: "image/jpg")
bob.surgeries.attach(io: File.open("app/assets/images/dr_green/x-ray-1.jpg"), filename: "x-ray-1.jpg", content_type: "image/jpg")
bob.surgeries.attach(io: File.open("app/assets/images/dr_green/x-ray-2.jpg"), filename: "x-ray-2.jpg", content_type: "image/jpg")
bob.surgeries.attach(io: File.open("app/assets/images/dr_green/electrocardiogram-1.png"), filename: "electrocardiogram-1.png", content_type: "image/png")
bob.surgeries.attach(io: File.open("app/assets/images/dr_green/electrocardiogram-2.png"), filename: "electrocardiogram-2.png", content_type: "image/png")
bob.lab_tests.attach(io: File.open("app/assets/images/dr_green/labtest-1.jpeg"), filename: "labtest-1.jpeg", content_type: "image/jpeg")
bob.lab_tests.attach(io: File.open("app/assets/images/dr_green/labtest-2.png"), filename: "labtest-1.png", content_type: "image/png")
bob.lab_tests.attach(io: File.open("app/assets/images/dr_green/blood-test-1.png"), filename: "blood-test-1.png", content_type: "image/png")
bob.genetic_results.attach(io: File.open("app/assets/images/dr_green/genetic-report-1.png"), filename: "genetic-report-1.png", content_type: "image/png")
bob.allergies.attach(io: File.open("app/assets/images/dr_green/allergy-test-1.jpg"), filename: "allergy-test-1.jpg", content_type: "image/jpg")
bob.save!
case_bob = Case.new(description: cardiologist[1],
                     title: "Carotid Artery Surgery")
case_bob.patient = bob
case_bob.user = doctor_leo
case_bob.save!

project_leo = Project.create!(name: "Carotid Artery Treatement",
                             description: cardiologist[1])
# Collaboratiob (admin)
collaboration_leo = Collaboration.new
collaboration_leo.project = project_leo
collaboration_leo.user = doctor_leo
collaboration_leo.role = 'admin'
collaboration_leo.save!
# ------ Link ------
# Link - case_bob
link_bob = Link.new
link_bob.project = project_leo
link_bob.case = case_bob
link_bob.save!
# Link - case_john
link_john = Link.new
link_john.project = project_leo
link_john.case = case_john
link_john.save!
# Link - case_may
link_may = Link.new
link_may.project = project_leo
link_may.case = case_may
link_may.save!
4.times do
  link_leo = Link.new
  link_leo.project = project_leo
  link_leo.case = Case.all.sample
  link_leo.save!
end
# ------ Collaboration (collaborators) ------
# Collaboration - Green
collaboration_green = Collaboration.new
collaboration_green.project = project_leo
collaboration_green.user = doctor_green
collaboration_green.role = 'collaborator'
collaboration_green.save!
# Collaboration - House
collaboration_house = Collaboration.new
collaboration_house.project = project_leo
collaboration_house.user = doctor_house
collaboration_house.role = 'collaborator'
collaboration_house.save!
6.times do
  collaboration_leo = Collaboration.new
  collaboration_leo.project = project_leo
  collaboration_leo.user = User.where.not(id: [doctor_leo, doctor_green, doctor_house]).sample
  collaboration_leo.role = 'collaborator'
  collaboration_leo.save!
end
# ------ Comments ------
# Comment - Green
comment_green = Comment.new(content: "If the artery blockage is less than X%,
                                     Balloon Angioplasty could be considered. It would
                                     enlarge the artery path and reduce the risk for future stroke.")
comment_green.user = doctor_green
comment_green.project = project_leo
comment_green.save!
# Comment - House
comment_house = Comment.new(content: "If you already have had a stroke, the surgery may help you avoid
                                     another one, especially if your arteries are very blocked.")
comment_house.user = doctor_house
comment_house.project = project_leo
comment_house.save!
8.times do
  comment_leo = Comment.new(content: comments.sample)
  comment_leo.user = User.all.sample
  comment_leo.project = project_leo
  comment_leo.save!
end
# -- Dr Green fake data to fill space --
# -- Dr Green Case --
5.times do
  case_jg = Case.new(description: case_descriptions.sample, title: case_titles.sample,
               patient_attributes: {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                                    gender: ["female", "male"].sample, address: Faker::Address.street_address,
                                    date_of_birth: Faker::Date.birthday(min_age: 10, max_age: 65)})
  case_jg.user = doctor_green
  case_jg.save!
end
# -- DrJ Project --
2.times do
  project_jg = Project.create!(name: project_names.sample, description: project_descriptions.sample)
  # Collaboratiob (admin)
  collaboration_jg = Collaboration.new
  collaboration_jg.project = project_jg
  collaboration_jg.user = doctor_green
  collaboration_jg.role = 'admin'
  collaboration_jg.save!
  # Link
  rand(5..7).times do
    link_jg = Link.new
    link_jg.project = project_jg
    link_jg.case = Case.all.sample
    link_jg.save!
  end
  # Collaboration (collaborators)
  rand(9..12).times do
    collaboration_jg = Collaboration.new
    collaboration_jg.project = project_jg
    collaboration_jg.user = User.where.not(id: [doctor_leo, doctor_green, doctor_house]).sample
    collaboration_jg.role = 'collaborator'
    collaboration_jg.save!
  end
  #Comments
  rand(5..8).times do
    comment_jg = Comment.new(content: comments.sample)
    comment_jg.user = User.all.sample
    comment_jg.project = project_jg
    comment_jg.save!
  end
end

#Dr Pharell
doctor_pharell = User.create!(first_name: "Mike", last_name: "Pharell",
                      specialization: "Rheumatologist", email: "mikepharell@bloom.com", password: "123456")
doctor_pharell.avatar.attach(io: File.open("app/assets/images/avatars/dr-pharell.png"), filename: "dr-pharell.png", content_type: "image/png")

catsandrine = Patient.new(first_name: "Catsandrine", last_name: "Levesque",
            gender: "female", address: Faker::Address.street_address,
            date_of_birth: "1983-02-14")
catsandrine.medications.attach(io: File.open("app/assets/images/dr_pharell/blood-test-1.jpg"), filename: "blood-test-1.jpg", content_type: "image/png")
catsandrine.medications.attach(io: File.open("app/assets/images/dr_pharell/blood-test-2.png"), filename: "blood-test-2.png", content_type: "image/png")
catsandrine.medications.attach(io: File.open("app/assets/images/dr_pharell/blood-test-3.png"), filename: "blood-test-3.png", content_type: "image/png")

catsandrine.treatments.attach(io: File.open("app/assets/images/dr_pharell/treatment-1.jpeg"), filename: "treatment-1.jpeg", content_type: "image/jpg")
catsandrine.treatments.attach(io: File.open("app/assets/images/dr_pharell/treatment-2.jpg"), filename: "treatment-2.jpg", content_type: "image/jpg")
catsandrine.treatments.attach(io: File.open("app/assets/images/dr_pharell/treatment-3.jpg"), filename: "treatment-3.jpg", content_type: "image/jpg")

catsandrine.surgeries.attach(io: File.open("app/assets/images/dr_pharell/surgery-1.png"), filename: "surgery-1.png", content_type: "image/jpg")
catsandrine.surgeries.attach(io: File.open("app/assets/images/dr_pharell/surgery-2.png"), filename: "surgery-2.png", content_type: "image/jpg")
catsandrine.surgeries.attach(io: File.open("app/assets/images/dr_pharell/surgery-3.png"), filename: "surgery-3.png", content_type: "image/jpg")
catsandrine.surgeries.attach(io: File.open("app/assets/images/dr_pharell/surgery-4.png"), filename: "surgery-4.png", content_type: "image/jpg")
catsandrine.surgeries.attach(io: File.open("app/assets/images/dr_pharell/surgery-5.jpg"), filename: "surgery-5.jpg", content_type: "image/jpg")

catsandrine.lab_tests.attach(io: File.open("app/assets/images/dr_pharell/xray-1.jpg"), filename: "xray-1.jpg", content_type: "image/jpeg")
catsandrine.lab_tests.attach(io: File.open("app/assets/images/dr_pharell/xray-2.jpg"), filename: "xray-2.jpg", content_type: "image/jpeg")
catsandrine.lab_tests.attach(io: File.open("app/assets/images/dr_pharell/xray-3.jpg"), filename: "xray-3.jpg", content_type: "image/jpeg")
catsandrine.lab_tests.attach(io: File.open("app/assets/images/dr_pharell/xray-4.jpg"), filename: "xray-4.jpg", content_type: "image/jpeg")
catsandrine.lab_tests.attach(io: File.open("app/assets/images/dr_pharell/xray-5.jpg"), filename: "xray-5.jpg", content_type: "image/jpeg")

catsandrine.save!
# -- case --
case_catsandrine = Case.new(description: case_descriptions.sample, title: case_titles.sample)
case_catsandrine.patient = catsandrine
case_catsandrine.user = doctor_pharell
case_catsandrine.save!

case_catsandrine_2 = Case.new(description: "A normally functioning immune system can tell the difference between “attachers”, such as germs or viruses, and healthy cells. When the body is attacked by illness, the immune system fights back. But when autoimmune dysfunction occurs, the immune system mistakes healthy cells for invaders, and attacks them instead. In someone with RA, this causes inflammation of the tissue around the joints. RA can also affect the eyes, lungs, skin, and heart.

Inflammation is a normal part of immune response. However, inflammation from RA is part of the problem. It causes considerable pain, damage to joints, and reduced mobility. The same substances that cause inflammation of the joints can also cause a fever, it is important to remember that infection is a real possibility. RA also causes an increase in metabolic rate, which can also result in a fever.",
                     title: "Inflammatory arthritis that features fevers")
case_catsandrine_2.patient = catsandrine
case_catsandrine_2.user = doctor_pharell
case_catsandrine_2.save!



sam = Patient.new(first_name: "Sam", last_name: "Bridge",
            gender: "male", address: Faker::Address.street_address,
            date_of_birth: "1988-04-06")
sam.medications.attach(io: File.open("app/assets/images/dr_green/medication-1.png"), filename: "medication-1.png", content_type: "image/png")
sam.treatments.attach(io: File.open("app/assets/images/dr_green/treatment-2-baloon.jpg"), filename: "treatment-2-baloon.jpg", content_type: "image/jpg")
sam.treatments.attach(io: File.open("app/assets/images/dr_green/treatment-3-laser.jpg"), filename: "treatment-3-laser.jpg", content_type: "image/jpg")
sam.surgeries.attach(io: File.open("app/assets/images/dr_green/treatment-1-surgery.jpg"), filename: "treatment-1-surgery.jpg", content_type: "image/jpg")
sam.surgeries.attach(io: File.open("app/assets/images/dr_green/x-ray-1.jpg"), filename: "x-ray-1.jpg", content_type: "image/jpg")
sam.surgeries.attach(io: File.open("app/assets/images/dr_green/x-ray-2.jpg"), filename: "x-ray-2.jpg", content_type: "image/jpg")
sam.surgeries.attach(io: File.open("app/assets/images/dr_green/electrocardiogram-1.png"), filename: "electrocardiogram-1.png", content_type: "image/png")
sam.surgeries.attach(io: File.open("app/assets/images/dr_green/electrocardiogram-2.png"), filename: "electrocardiogram-2.png", content_type: "image/png")
sam.lab_tests.attach(io: File.open("app/assets/images/dr_green/labtest-1.jpeg"), filename: "labtest-1.jpeg", content_type: "image/jpeg")
sam.lab_tests.attach(io: File.open("app/assets/images/dr_green/labtest-2.png"), filename: "labtest-1.png", content_type: "image/png")
sam.lab_tests.attach(io: File.open("app/assets/images/dr_green/blood-test-1.png"), filename: "blood-test-1.png", content_type: "image/png")
sam.genetic_results.attach(io: File.open("app/assets/images/dr_green/genetic-report-1.png"), filename: "genetic-report-1.png", content_type: "image/png")
sam.allergies.attach(io: File.open("app/assets/images/dr_green/allergy-test-1.jpg"), filename: "allergy-test-1.jpg", content_type: "image/jpg")
sam.save!
case_sam = Case.new(description: cardiologist[0],
                     title: "Enlargement of the liver and spleen, swollen lymph nodes")
case_sam.patient = sam
case_sam.user = doctor_pharell
case_sam.save!

# Doctor Pharell fake data to fill space
5.times do
  case_mp = Case.new(description: case_descriptions.sample, title: case_titles.sample,
               patient_attributes: {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                                    gender: ["female", "male"].sample, address: Faker::Address.street_address,
                                    date_of_birth: Faker::Date.birthday(min_age: 10, max_age: 65)})
  case_mp.user = doctor_pharell
  case_mp.save!
end
# -- DrJ Project --
2.times do
  project_mp = Project.create!(name: project_names.sample, description: project_descriptions.sample)
  # Collaboratiob (admin)
  collaboration_mp = Collaboration.new
  collaboration_mp.project = project_mp
  collaboration_mp.user = doctor_pharell
  collaboration_mp.role = 'admin'
  collaboration_mp.save!
  # Link
  6.times do
    link_mp = Link.new
    link_mp.project = project_mp
    link_mp.case = Case.all.sample
    link_mp.save!
  end
  # Collaboration (collaborators)
  rand(9..12).times do
    collaboration_mp = Collaboration.new
    collaboration_mp.project = project_mp
    collaboration_mp.user = User.where.not(id: [doctor_pharell, doctor_leo, doctor_green]).sample
    collaboration_mp.role = 'collaborator'
    collaboration_mp.save!
  end
  #Comments
  rand(5..8).times do
    comment_mp = Comment.new(content: comments.sample)
    comment_mp.user = User.all.sample
    comment_mp.project = project_mp
    comment_mp.save!
  end
end

# -- Dr Bigras --
doctor_big = User.create!(first_name: "Frank", last_name: "Bigras",
                      specialization: "Rheumatologist", email: "frankbigras@bloom.com", password: "123456")
doctor_big.avatar.attach(io: File.open("app/assets/images/avatars/dr-m-bigras.jpg"), filename: "dr-m-bigras.jpg", content_type: "image/jpg")

chad = Patient.new(first_name: "Chad", last_name: "Leonard",
            gender: "male", address: Faker::Address.street_address,
            date_of_birth: "1974-10-21")
chad.medications.attach(io: File.open("app/assets/images/dr_green/medication-1.png"), filename: "medication-1.png", content_type: "image/png")
chad.treatments.attach(io: File.open("app/assets/images/dr_green/treatment-2-baloon.jpg"), filename: "treatment-2-baloon.jpg", content_type: "image/jpg")
chad.treatments.attach(io: File.open("app/assets/images/dr_green/treatment-3-laser.jpg"), filename: "treatment-3-laser.jpg", content_type: "image/jpg")
chad.surgeries.attach(io: File.open("app/assets/images/dr_green/treatment-1-surgery.jpg"), filename: "treatment-1-surgery.jpg", content_type: "image/jpg")
chad.surgeries.attach(io: File.open("app/assets/images/dr_green/x-ray-1.jpg"), filename: "x-ray-1.jpg", content_type: "image/jpg")
chad.surgeries.attach(io: File.open("app/assets/images/dr_green/x-ray-2.jpg"), filename: "x-ray-2.jpg", content_type: "image/jpg")
chad.surgeries.attach(io: File.open("app/assets/images/dr_green/electrocardiogram-1.png"), filename: "electrocardiogram-1.png", content_type: "image/png")
chad.surgeries.attach(io: File.open("app/assets/images/dr_green/electrocardiogram-2.png"), filename: "electrocardiogram-2.png", content_type: "image/png")
chad.lab_tests.attach(io: File.open("app/assets/images/dr_green/labtest-1.jpeg"), filename: "labtest-1.jpeg", content_type: "image/jpeg")
chad.lab_tests.attach(io: File.open("app/assets/images/dr_green/labtest-2.png"), filename: "labtest-1.png", content_type: "image/png")
chad.lab_tests.attach(io: File.open("app/assets/images/dr_green/blood-test-1.png"), filename: "blood-test-1.png", content_type: "image/png")
chad.genetic_results.attach(io: File.open("app/assets/images/dr_green/genetic-report-1.png"), filename: "genetic-report-1.png", content_type: "image/png")
chad.allergies.attach(io: File.open("app/assets/images/dr_green/allergy-test-1.jpg"), filename: "allergy-test-1.jpg", content_type: "image/jpg")
chad.save!
case_chad = Case.new(description: cardiologist[1],
                     title: "Adult-onset Still's disease")
case_chad.patient = chad
case_chad.user = doctor_big
case_chad.save!

# -- Dr Parker
doctor_parker = User.create!(first_name: "Tony", last_name: "Parker",
                      specialization: "Rheumatologist", email: "tonyparker@bloom.com", password: "123456")
doctor_big.avatar.attach(io: File.open("app/assets/images/avatars/dr-m-3.png"), filename: "dr-m-3.png", content_type: "image/jpg")

mark = Patient.new(first_name: "Mark", last_name: "Collin",
            gender: "male", address: Faker::Address.street_address,
            date_of_birth: "1990-11-15")
mark.medications.attach(io: File.open("app/assets/images/dr_green/medication-1.png"), filename: "medication-1.png", content_type: "image/png")
mark.treatments.attach(io: File.open("app/assets/images/dr_green/treatment-2-baloon.jpg"), filename: "treatment-2-baloon.jpg", content_type: "image/jpg")
mark.treatments.attach(io: File.open("app/assets/images/dr_green/treatment-3-laser.jpg"), filename: "treatment-3-laser.jpg", content_type: "image/jpg")
mark.surgeries.attach(io: File.open("app/assets/images/dr_green/treatment-1-surgery.jpg"), filename: "treatment-1-surgery.jpg", content_type: "image/jpg")
mark.surgeries.attach(io: File.open("app/assets/images/dr_green/x-ray-1.jpg"), filename: "x-ray-1.jpg", content_type: "image/jpg")
mark.surgeries.attach(io: File.open("app/assets/images/dr_green/x-ray-2.jpg"), filename: "x-ray-2.jpg", content_type: "image/jpg")
mark.surgeries.attach(io: File.open("app/assets/images/dr_green/electrocardiogram-1.png"), filename: "electrocardiogram-1.png", content_type: "image/png")
mark.surgeries.attach(io: File.open("app/assets/images/dr_green/electrocardiogram-2.png"), filename: "electrocardiogram-2.png", content_type: "image/png")
mark.lab_tests.attach(io: File.open("app/assets/images/dr_green/labtest-1.jpeg"), filename: "labtest-1.jpeg", content_type: "image/jpeg")
mark.lab_tests.attach(io: File.open("app/assets/images/dr_green/labtest-2.png"), filename: "labtest-1.png", content_type: "image/png")
mark.lab_tests.attach(io: File.open("app/assets/images/dr_green/blood-test-1.png"), filename: "blood-test-1.png", content_type: "image/png")
mark.genetic_results.attach(io: File.open("app/assets/images/dr_green/genetic-report-1.png"), filename: "genetic-report-1.png", content_type: "image/png")
mark.allergies.attach(io: File.open("app/assets/images/dr_green/allergy-test-1.jpg"), filename: "allergy-test-1.jpg", content_type: "image/jpg")
mark.save!
case_mark = Case.new(description: cardiologist[1],
                     title: "Systemic autoinflammatory disease")
case_mark.patient = mark
case_mark.user = doctor_parker
case_mark.save!


project_big = Project.create!(name: "Adult-onset Still's disease Treatement",
                             description: cardiologist[1])
# Collaboratiob (admin)
collaboration_big = Collaboration.new
collaboration_big.project = project_big
collaboration_big.user = doctor_big
collaboration_big.role = 'admin'
collaboration_big.save!
# ------ Link ------
# Link - case_chad
link_chad = Link.new
link_chad.project = project_big
link_chad.case = case_chad
link_chad.save!
# Link - case_sam
link_sam = Link.new
link_sam.project = project_big
link_sam.case = case_sam
link_sam.save!
# Link - case_mark
link_mark = Link.new
link_mark.project = project_big
link_mark.case = case_mark
link_mark.save!
4.times do
  link_big = Link.new
  link_big.project = project_big
  link_big.case = Case.all.sample
  link_big.save!
end
# ------ Collaboration (collaborators) ------
# # Collaboration - Pharell
# collaboration_pharell = Collaboration.new
# collaboration_pharell.project = project_big
# collaboration_pharell.user = doctor_pharell
# collaboration_pharell.role = 'collaborator'
# collaboration_pharell.save!
# Collaboration - Parker
collaboration_parker = Collaboration.new
collaboration_parker.project = project_big
collaboration_parker.user = doctor_parker
collaboration_parker.role = 'collaborator'
collaboration_parker.save!
6.times do
  collaboration_big = Collaboration.new
  collaboration_big.project = project_big
  collaboration_big.user = User.where.not(id: [doctor_big, doctor_pharell, doctor_leo, doctor_green]).sample
  collaboration_big.role = 'collaborator'
  collaboration_big.save!
end
# ------ Comments ------
# Comment - Bigras
comment_big = Comment.new(content: "My patient was then referred to another institute for further rheumatology investigation and workup,
                                    where a PET scan showed diffuse supraclavicular, mediastinal, and hilar lymphadenopathy")
comment_big.user = doctor_big
comment_big.project = project_big
comment_big.save!
# Comment - Parker
comment_parker = Comment.new(content: "Given the new findings in my patient's history, persistent fever, arthritis,
                                      and rashes, the possibility of AOSD was raised and serum ferritin levels were ordered;
                                      and revealed highly elevated levels (2,723 ng/mL).")
comment_parker.user = doctor_parker
comment_parker.project = project_big
comment_parker.save!
8.times do
  comment_big = Comment.new(content: comments.sample)
  comment_big.user = User.all.sample
  comment_big.project = project_big
  comment_big.save!
end


puts "done seeding..."
