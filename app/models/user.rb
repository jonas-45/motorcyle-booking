class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :motorcycles, through: :reservations, dependent: :destroy

  devise :database_authenticatable, :registerable, :rememberable, authentication_keys: [:username]

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validate :password_confirmation_match
  validates :password, presence: true, confirmation: true, on: :create

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    username = conditions.delete(:username)
    where(conditions).where(["lower(username) = :value", { value: username.strip.downcase }]).first
  end

  def password_confirmation_match
    errors.add(:password_confirmation, "must match password") if password != password_confirmation
  end
end
