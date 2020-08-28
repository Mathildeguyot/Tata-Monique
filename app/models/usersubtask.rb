class Usersubtask < ApplicationRecord
  belongs_to :user
  belongs_to :subtask
  has_many :users
  has_many :documents, through: :users

  accepts_nested_attributes_for :documents

end
