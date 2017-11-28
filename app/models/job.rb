class Job < ApplicationRecord
  has_many :boats
  belongs_to :user
end
