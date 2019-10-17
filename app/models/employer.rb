class Employer < ApplicationRecord
  attr_accessor :remember_token
  # Declare relationship
  has_many :jobs
  # Employer's infomation - will add accordingly with new data and such if necessary...
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {minimum: 4, maximum: 60}
  validates :info, presence: true, length: {minimum: 4, maximum: 500}
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {minimum: 4, maximum: 255 }, 
  format: { with: EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
  
  def Employer.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end 
  
  def Employer.new_token
    SecureRandom.urlsafe_base64
  end 
  
  def remember
    self.remember_token = Employer.new_token
    update_attribute(:remember_digest, Employer.digest(remember_token))
  end
  
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def self.new_token
    SecureRandom.urlsafe_base64
  end
  
  class << self
    
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
    
    def new_token
      SecureRandom.urlsafe_base64
    end
  end
  
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?
    (remember_token)
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
  
end
  
  
  

