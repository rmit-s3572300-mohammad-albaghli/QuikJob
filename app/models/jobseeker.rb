class Jobseeker < ApplicationRecord
  
  #Validations
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { minimum: 4, maximum: 60 }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 4, maximum: 255 }, format: { with: EMAIL_REGEX}, uniqueness: true
  
  #Password for jobseeker
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  
end
