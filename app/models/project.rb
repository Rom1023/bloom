class Project < ApplicationRecord
  has_many :collaborations, dependent: :destroy
  has_many :links
  has_many :cases, through: :links
  has_many :users, through: :collaborations
  has_many :comments

  # validates :collaborations, presence: true

  def is_admin?(user_id)
    admin = collaborations.find_by(role: 'admin', user_id: user_id)
    admin.presence
  end
end
