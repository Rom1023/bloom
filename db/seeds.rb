require 'faker'

puts "destroying records..."

User.destroy_all
Case.destroy_all

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
4.times do
  c = Case.new(description: descriptions[0].sample, title: Faker::Book.title,
               patient_attributes: {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                                    gender: ["female", "male"].sample, address: Faker::Address.street_address,
                                    date_of_birth: Faker::Date.birthday(min_age: 10, max_age: 65)})
  c.user = user_1
  c.save!
end

6.times do
  c = Case.new(description: descriptions[1].sample, title: Faker::Book.title,
               patient_attributes: {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                                    gender: ["female", "male"].sample, address: Faker::Address.street_address,
                                    date_of_birth: Faker::Date.birthday(min_age: 10, max_age: 65)})
  c.user = user_2
  c.save!
end

3.times do
  c = Case.new(description: descriptions[2].sample, title: Faker::Book.title,
               patient_attributes: {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                                    gender: ["female", "male"].sample, address: Faker::Address.street_address,
                                    date_of_birth: Faker::Date.birthday(min_age: 10, max_age: 65)})
  c.user = user_3
  c.save!
end

7.times do
  c = Case.new(description: descriptions[3].sample, title: Faker::Book.title,
               patient_attributes: {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                                    gender: ["female", "male"].sample, address: Faker::Address.street_address,
                                    date_of_birth: Faker::Date.birthday(min_age: 10, max_age: 65)})
  c.user = user_4
  c.save!
end

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
project_1 = Project.create!(name: "Adenoid Cystic Carcinoma (ACC)", description: "Adenoid cystic carcinoma (ACC) is a rare form of cancer (adenocarcinoma)
 that most often arises in the salivary glands but may occur in other locations like the breast or uterus.")

link_1 = Link.new
link_1.project = project_1
link_1.case = case_2
link_1.save!

project_2 = Project.create!(name: "Ileostomy (Ulcerative Colitis Surgery)", description: "Ulcerative colitis is a chronic (long-term) inflammatory disease.
  It affects the lining of the large intestine, or colon, and rectum. The rectum is the last section of the colon and is located just above the anus.
  People with ulcerative colitis have tiny ulcers and abscesses in their colon and rectum. These flare up periodically and cause bloody stools and diarrhea.
  Ulcerative colitis may also cause severe abdominal pain and anemia. Anemia is marked by low levels of healthy red blood cells.")

link_2 = Link.new
link_2.project = project_2
link_2.case = case_3
link_2.save!

project_3 = Project.create!(name: "Pain Management: Neuropathic Pain", description: "Neuropathic pain is a complex, chronic pain state that usually is accompanied by tissue injury.
  With neuropathic pain, the nerve fibers themselves may be damaged, dysfunctional or injured.
  These damaged nerve fibers send incorrect signals to other pain centers.
  The impact of nerve fiber injury includes a change in nerve function both at the site of injury and areas around the injury.

One example of neuropathic pain is called phantom limb syndrome. This occurs when an arm or a leg has been removed because of illness or injury,
but the brain still gets pain messages from the nerves that originally carried impulses from the missing limb. These nerves now misfire and cause pain.")

link_3 = Link.new
link_3.project = project_3
link_3.case = user_3.cases[1]
link_3.save!

project_4 = Project.create!(name: "Parenchymal Diffuse Lung Disease (Interstitial Lung Disease (Interstitial Pneumonia))", description: "Interstitial lung disease includes a group of
  diseases that have thickening of the supporting tissues between the air sacs of the lungs. This thickening can be due to a variety of causes such as:
Associated autoimmune or collagen vascular diseases
Exposure to medications or toxins such as asbestos, tobacco smoke, or environmental toxins
Associated genetic diseases
The cause is not known (idiopathic).
The most common symptoms of interstitial lung disease are a dry cough and shortness of breath.")

link_4 = Link.new
link_4.project = project_4
link_4.case = user_4.cases[0]
link_4.save!

project_5 = Project.create!(name: "DeQuervains Tenosynovitis (De Quervain's Tenosynovitis)", description: "De Quervain's tenosynovitis is inflammation of
  tendons on the side of the wrist at the base of the thumb. These tendons include the extensor pollicis brevis and the abductor pollicis longus tendons,
  which extend the joints of the thumb.")

link_5 = Link.new
link_5.project = project_5
link_5.case = user_2.cases[0]
link_5.save!


# == fill the space data: User, Case, Patient, Project, Link, Collaboration, Comment ==
specializations = ["psychiatry", "rheumatologist", "neurologist", "gynaecologist",
                   "cardiologist", "oncologist", "urologist", "gastroenterologist"]
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
              "Varius tincidunt()", "Nullamos quis antef()"]
project_names = ["Felis eu depe mollis prutism()", "Pellentfsesque eu prefatium()",
                "Viverra qusis fegiat()", "ultrifcies mid eu turpids hendfrerit()",
                "Etiavm impdiet imposerdiet orc()", "Consectetuer lacinia nam pretfaium()"]
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

10.times do
  user_sample = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
               specialization: specializations.sample, email: Faker::Internet.email, password: "123456")
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
end
# =====
puts "done seeding..."
