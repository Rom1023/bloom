class Collaboration < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :role, inclusion: { in: %w(admin collaborator)}

  scope :collaborator, -> { where.not(role: 'admin') }
end
