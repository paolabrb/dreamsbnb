class Dream < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :duration, presence: true
end
