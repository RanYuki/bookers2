class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  validates :name, presence: true, length:{ in:2..20 }
  attachment :image
  validates :introduction, length: { maximum: 50 }
end

