class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :avatar, :role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :poems
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 50}, format: {with: VALID_EMAIL}
  validates :password, presence: true
  validates :password_confirmation, presence: true

  mount_uploader :avatar, AvatarUploader
  make_flagger
  
  ROLES = %w[admin moderator author banned]
end
