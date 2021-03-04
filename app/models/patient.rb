class Patient < ApplicationRecord
  has_many :cases
  has_many :users, through: :cases
  has_many_attached :photos
  has_many_attached :documents

  validates :first_name, :last_name, presence: true
  validates :gender, inclusion: { in: ['male', 'female'] }

  def age
    Date.today.year - self.date_of_birth.year
  end
end
