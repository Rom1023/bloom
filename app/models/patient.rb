class Patient < ApplicationRecord
  has_many :cases
  has_many :users, through: :cases
  has_many_attached :photos
  has_many_attached :documents

  validates :first_name, :last_name, presence: true
end
