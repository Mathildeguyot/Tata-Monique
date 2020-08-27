class Usersubtask < ApplicationRecord
  belongs_to :user
  belongs_to :subtask
  has_many :documents, through: :users
end
