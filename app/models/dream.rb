class Dream < ApplicationRecord
  VIBES = ["floating","empowering" ,"careless", "vibrant", "optimistic", "happy", "stoned", "light" ,"fun", "realistic", "emotional" , "psychedelic", "sexual", "loving" , "healing", "futuristic", "past"]
  has_many :bookings
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :duration, presence: true
  validates :vibe, inclusion: { in: VIBES, message:"please choose from the list" }
end
