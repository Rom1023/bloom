class Case < ApplicationRecord
  belongs_to :user
  belongs_to :patient
  has_many :links, dependent: :destroy

  accepts_nested_attributes_for :patient
end
