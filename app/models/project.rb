class Project < ApplicationRecord
  has_many :collaborations, dependent: :destroy
  has_many :links
end
