class Idea < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :category, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
