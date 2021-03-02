class Patient < ApplicationRecord
  has_many :cases
  has_many :users, through: :cases
end
