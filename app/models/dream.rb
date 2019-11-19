class Dream < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :duration, presence: true
  # validates :vibe, inclusion: { in: %w[floating empowering careless vibrant optimistic happy stoned light fun realistic emotional psychedelic sexual loving healing futuristic past], message:"please choose from the list" }
end
