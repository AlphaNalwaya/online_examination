class Admin < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :email, uniqueness: true, on: :account_setup
  validates :password, confirmation: { case_sensitive: false}, length: { in: 6..20}	
end