class Case < ApplicationRecord
  belongs_to :user
  belongs_to :patient
  has_many :links, dependent: :destroy
  has_many :projects, through: :links

  accepts_nested_attributes_for :patient

  def to_label
    self.title || "untitled case"
  end
end
