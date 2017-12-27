class User < ApplicationRecord
  has_many :books
  has_many :comments, through: :books
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates :email, uniqueness: true, presence: true
end
