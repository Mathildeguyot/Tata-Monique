class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks, through: :usertasks
  has_many :documents
  has_one :habitation
  has_one :familial_situation
  has_one :professional_situation
  has_one :health

end
