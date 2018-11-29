class Idea < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :category, presence: true
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch
  pg_search_scope :search_by_title_and_category_and_description,
                  against: [:title, :category, :description],
                  using: {
                    tsearch: {
                      prefix: true
                    }
                  }
end
