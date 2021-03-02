class Link < ApplicationRecord
  belongs_to :case, foreign_key: true
  belongs_to :project, foreign_key: true
end
