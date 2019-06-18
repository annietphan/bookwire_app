class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :comment, :rating, presence: true

end
