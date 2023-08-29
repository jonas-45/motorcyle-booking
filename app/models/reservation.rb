class Reservation < ApplicationRecord
  belongs_to :motorcycle
  belongs_to :user

  validates :reservation_time, presence: true
  validates :reservation_date, presence: true
end
