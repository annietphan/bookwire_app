class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :comment, :recommend, presence: true
end
