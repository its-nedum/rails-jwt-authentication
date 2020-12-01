class User < ApplicationRecord
  has_secure_password
  
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 6 }, presence: true
end
