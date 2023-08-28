class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :motorcycles, through: :reservations, dependent: :destroy

  validates :username, uniqueness: { case_sensitive: false }
end
