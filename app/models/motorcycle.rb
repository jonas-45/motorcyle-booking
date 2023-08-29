class Motorcycle < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
