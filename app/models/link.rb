class Link < ApplicationRecord
  belongs_to :case
  belongs_to :project
end
