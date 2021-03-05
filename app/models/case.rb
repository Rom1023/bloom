class Case < ApplicationRecord
  belongs_to :user
  belongs_to :patient
  has_many :links, dependent: :destroy
  has_many :projects, through: :links

  accepts_nested_attributes_for :patient
end
