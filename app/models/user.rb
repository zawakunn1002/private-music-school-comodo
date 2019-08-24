class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #モデル指定
  has_many :user_children, dependent: :destroy
  accepts_nested_attributes_for :user_children
  has_many :favorites, dependent: :destroy
  has_many :favorite_notices, through: :favorites, source: :notice, dependent: :destroy
end
