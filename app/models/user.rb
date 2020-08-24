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

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :encrypted_password, presence: true
  validates :birth_date, presence: true
  validates :birth_location, presence: true
  validates :ID_number, presence: true, format: { with: /^([0-9]{12})(X|V)$/ }
  validates :nationality, presence: true
  validates :username, presence: true
end
