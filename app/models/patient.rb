class Patient < ApplicationRecord
  has_many :cases
  has_many :users, through: :cases

  validates :first_name, :last_name, presence: true
end
