class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :tweets

  has_many :tags, through: :tweets

  mount_uploader :avatar, AvatarUploader

  validates :username, presence: true
  validates :username, uniqueness: true

  serialize :following, Array
end
