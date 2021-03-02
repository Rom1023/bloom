class Project < ApplicationRecord
  has_many :cases, through: :links
  has_many :users, through: :collaborations
end
