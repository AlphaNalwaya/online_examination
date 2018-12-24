class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :results 

  before_save { self.email = email.downcase }
  validates :username, presence: true,
            uniqueness: { case_sensitive: false},
            length: { minimum: 2, maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            length: { maximum: 150},
            uniqueness: { case_sensitive: false},
            format: { with: VALID_EMAIL_REGEX }    
end