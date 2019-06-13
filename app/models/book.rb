class Book < ApplicationRecord
  belongs_to :club
  belongs_to :user
end
