class Patient < ApplicationRecord
  has_many :cases
  belongs_to :users, through: :cases
end
