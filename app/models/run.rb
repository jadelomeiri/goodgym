class Run < ApplicationRecord
  has_many :registrations
  has_many :users, through: :registrations

  validates :starting_at, presence: true
  validates :registration_limit, numericality: { greater_than_or_equal_to: 0,  only_integer: true }
  validates :registrations_booked, numericality: { greater_than_or_equal_to: 0,  only_integer: true }
end
