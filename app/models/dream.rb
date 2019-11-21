class Dream < ApplicationRecord
  include PgSearch::Model
  mount_uploader :photo, PhotoUploader

  VIBES = ['Careless', 'Emotional', 'Empowering', 'Floating', 'Fun', 'Futuristic', 'Happy', 'Healing', 'Light', 'Loving', 'Optimistic', 'Past', 'Psychedelic', 'Realistic', 'Sexual', 'Stoned', 'Vibrant']

  has_many :bookings, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :duration, presence: true
  validates :vibe, inclusion: { in: VIBES, message:"please choose from the list" }

  pg_search_scope :search_by_vibe, against: :vibe
end
