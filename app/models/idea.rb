class Idea < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :minimum_application_duration, presence: true
end
