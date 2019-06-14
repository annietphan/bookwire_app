class Book < ApplicationRecord
  belongs_to :club, inverse_of: :book
  belongs_to :user
end
