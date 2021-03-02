class Project < ApplicationRecord
  has_many :cases, through: :links
  has_many :users, through: :collaborations
  has_many :collaborations

  validates :collaborations, presence: true
end
