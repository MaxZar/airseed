class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :idea

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :request_message, presence: true, length: { minimun: 100 }
end
