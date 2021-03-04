class Comment < ApplicationRecord
  belongs_to :user, foreign_key: true
  belongs_to :project, foreign_key: true
  validates :content, presence: true
end
