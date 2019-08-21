class Employer < ApplicationRecord
  # Declare relationship
  has_many :jobs
  # Employer's infomation - will add accordingly with new data and such if necessary...
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {minimum: 4, maximum: 60}
  validates :info, presence: true, length: {minimum: 4, maximum: 160}
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {minimum: 4, maximum: 255 }, 
  format: { with: EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
end
