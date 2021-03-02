class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cases, dependent: :destroy
  has_many :collaborations
  has_many :projects, through: :collaborations
  has_many :patients, through: :cases
end
