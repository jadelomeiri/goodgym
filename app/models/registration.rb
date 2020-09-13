class Registration < ApplicationRecord
  belongs_to :run
  belongs_to :user

  validates :run, uniqueness: { scope: [:user] }
end
