class Registration < ApplicationRecord
  belongs_to :run
  belongs_to :user
end
