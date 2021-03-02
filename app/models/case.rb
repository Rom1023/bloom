class Case < ApplicationRecord
  belongs_to :user, foreign_key: true
  belongs_to :patient, foreign_key: true
  has_many :links, dependent: :destroy

  accepts_nested_attributes_for :patient
end
