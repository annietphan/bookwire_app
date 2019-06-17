class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews

  validates :title, :genre, :author, :summary, presence: true
end
