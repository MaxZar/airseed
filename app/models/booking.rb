class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :idea
  has_many :reviews

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :request_message, presence: true, length: { minimum: 100 }
end




#comment
