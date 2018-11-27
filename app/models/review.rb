class Review < ApplicationRecord
  belongs_to :booking

  validates :comment, presence: true
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }, allow_blank: false, numericality: {only_integer: true}
end
