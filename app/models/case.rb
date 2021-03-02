class Case < ApplicationRecord
  belongs_to :user
  belongs_to :patient
  has_many :links, dependent: :destroy
end
