require 'faker'

require 'faker'

puts "destroying records..."

# User.destroy_all

puts "start seeding..."

# == User ==
user_1 = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                      specialization: "Orthopaedic", email: "user1@test.com", password: "123456")

user_2 = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                      specialization: "Rheumatologist", email: "user2@test.com", password: "123456")

user_3 = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                      specialization: "Neurologist", email: "user3@test.com", password: "123456")

user_4 = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                      specialization: "Cardiologist", email: "user4@test.com", password: "123456")

# == Case + Patient==
# -- case description --
orthopaedic = []
rheumatologist = []
neurologist = []
cardiologist = []
descriptions = [orthopaedic, rheumatologist, neurologist, cardiologist]

orthopaedic << "Low back pain is classified as acute (or short term) and chronic. Acute low back pain
               lasts from a few days to a few weeks. Most acute low back pain will resolve on its own.
               Chronic low back pain lasts for more than 3 months and often gets worse. The cause of
               chronic low back pain can be hard to find. These are the most common symptoms of low
               back pain. Symptoms may include discomfort or pain in the lower back that is: Aching,
               Burning, Stabbing, Sharp or dull, Well-defined or vague. The pain may radiate into one
               or both buttocks or even into the thigh or hip area. The symptoms of low back pain may
               look like other health problems. Always see your healthcare provider for a diagnosis."
orthopaedic << "Bursitis is the inflammation of a fluid-filled sac around a joint. The bursa helps
               tendons slide smoothly over and around bones, and when it is inflamed (bursitis), you
               may experience pain, swelling and stiffness in the affected joint. Bursitis most commonly
               occurs in the knees, elbows, shoulders, and hips. Bursitis can develop acutely or can
               be a chronic condition that comes and goes over a long period of time. Bursitis can be
               caused by trauma to a joint, the overuse of a joint, or medical conditions such as
               arthritis or gout. Bursitis is most common in middle-aged individuals. Bursitis can
               affect anyone, but people who use a specific joint a great deal, such as the way a
               tennis player uses his or her elbow, and older people who have arthritis or gout are
               at the most risk. Bursitis is not a life-threatening condition, but it can severely
               impair mobility in the affected joint."
rheumatologist << "A rheumatologist is a board certified internist or pediatrician who is qualified by
                  additional training and experience in the diagnosis and treatment of arthritis and
                  other diseases of the joints, muscles, and bones. After four years of medical school
                  and three years of training in either internal medicine or pediatrics, rheumatologists
                  devote an additional two to three years in specialized rheumatology training. Most
                  rheumatologists who plan to treat patients choose to become board certified. Upon
                  completion of their training, they must pass a rigorous exam conducted by the American
                  Board of Internal Medicine to become certified."
rheumatologist << "Rheumatoid arthritis is a long-term, progressive, and disabling autoimmune disease.
                  It causes inflammation, swelling, and pain in and around the joints and other body
                  organs. Rheumatoid arthritis (RA) usually affects the hands and feet first, but it
                  can occur in any joint. It usually involves the same joints on both sides of the body.
                  Common symptoms include stiff joints, especially upon getting up in the mornings or
                  after sitting down for a while. Some people often experience fatigue and a general
                  feeling of being unwell.The Rheumatoid Arthritis Support Network estimate that RA
                  affects up to 1 percent of the world’s population and over 1.3 million people in America."
cardiologist << "Heart and blood vessel disease (also called heart disease) includes numerous problems,
                many of which are related to a process called atherosclerosis. Atherosclerosis is a
                condition that develops when a substance called plaque builds up in the walls of the
                arteries. This buildup narrows the arteries, making it harder for blood to flow through.
                If a blood clot forms, it can block the blood flow. This can cause a heart attack or stroke."
cardiologist << "A buildup of fatty plaques in your arteries, or atherosclerosis (ath-ur-o-skluh-ROE-sis) can
                damage your blood vessels and heart. Plaque buildup causes narrowed or blocked blood vessels
                that can lead to a heart attack, chest pain (angina) or stroke. Coronary artery disease symptoms
                may be different for men and women. For instance, men are more likely to have chest pain. Women
                are more likely to have other signs and symptoms along with chest discomfort, such as shortness
                of breath, nausea and extreme fatigue. Signs and symptoms can include: Chest pain, chest
                tightness, chest pressure and chest discomfort (angina). Shortness of breath. Pain, numbness,
                weakness or coldness in your legs or arms if the blood vessels in those parts of your body
                are narrowed. Pain in the neck, jaw, throat, upper abdomen or back"
neurologist << "Alzheimer’s disease is a progressive form of dementia. Dementia is a broader term for
               conditions caused by brain injuries or diseases that negatively affect memory, thinking,
               and behavior. These changes interfere with daily living. According to the Alzheimer’s
               Association, Alzheimer’s disease accounts for 60 to 80 percent of dementia cases. Most
               people with the disease get a diagnosis after age 65. If it’s diagnosed before then,
               it’s generally referred to as early onset Alzheimer’s disease. There’s no cure for
               Alzheimer’s, but there are treatments that can slow the progression of the disease."
neurologist << "Seizures are changes in the brain’s electrical activity. These changes can cause dramatic,
               noticeable symptoms, or in other cases no symptoms at all. The symptoms of a severe seizure
               include violent shaking and a loss of control. However, mild seizures can also be a sign of a
               significant medical problem, so recognizing them is important. Because some seizures can lead
               to injury or be a sign of an underlying medical condition, it’s important to seek treatment if
               you experience them."
# -- Cases + Patients ()--
2.times do
  c = Case.new(description: descriptions[0].sample,
               patient_attributes: {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                                    gender: ["female", "male"].sample, address: Faker::Address.street_address,
                                    date_of_birth: Faker::Date.birthday(min_age: 10, max_age: 65)})
  c.user = user_1
  c.save!
end

2.times do
  c = Case.new(description: descriptions[1].sample,
               patient_attributes: {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                                    gender: ["female", "male"].sample, address: Faker::Address.street_address,
                                    date_of_birth: Faker::Date.birthday(min_age: 10, max_age: 65)})
  c.user = user_2
  c.save!
end

2.times do
  c = Case.new(description: descriptions[2].sample,
               patient_attributes: {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                                    gender: ["female", "male"].sample, address: Faker::Address.street_address,
                                    date_of_birth: Faker::Date.birthday(min_age: 10, max_age: 65)})
  c.user = user_3
  c.save!
end

2.times do
  c = Case.new(description: descriptions[3].sample,
               patient_attributes: {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                                    gender: ["female", "male"].sample, address: Faker::Address.street_address,
                                    date_of_birth: Faker::Date.birthday(min_age: 10, max_age: 65)})
  c.user = user_4
  c.save!
end

puts "done seeding..."
