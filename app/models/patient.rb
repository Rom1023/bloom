class Patient < ApplicationRecord
  has_many :cases
  has_many :users, through: :cases

  has_many_attached :medications
  has_many_attached :treatments
  has_many_attached :surgeries
  has_many_attached :lab_tests
  has_many_attached :genetic_results
  has_many_attached :allergies

  validates :first_name, :last_name, presence: true
  validates :gender, inclusion: { in: ['male', 'female'] }

  def age
    Date.today.year - self.date_of_birth.year
  end

  def patient_full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

end
