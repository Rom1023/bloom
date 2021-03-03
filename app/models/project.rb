class Project < ApplicationRecord
  has_many :cases, through: :links
  has_many :users, through: :collaborations
  has_many :collaborations, dependent: :destroy
  has_many :links

  # validates :collaborations, presence: true
end
