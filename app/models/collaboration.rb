class Collaboration < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :role, inclusion: { in: %w(admin collaborator)}

  scope :project_collaborations, -> { where.not(role: 'admin') }
end
