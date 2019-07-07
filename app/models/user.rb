class User < ApplicationRecord

  has_many :posts
  has_many :comments
  has_many :likes

  enum sexualRepresentation: [:she, :he, :they]

  has_secure_password #for auth
  validates :username, uniqueness: { case_sensitive: false }
end
