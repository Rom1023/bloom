class Case < ApplicationRecord
  belongs_to :user
  belongs_to :patient
  has_many :links, dependent: :destroy
  has_many :projects, through: :links

  accepts_nested_attributes_for :patient

  default_scope { order("created_at DESC") }
  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
                  against: [:title, :description],
                  using: {
                    tsearch: { prefix: true }
                  }

  def to_label
    self.title || "untitled case"
  end
end
