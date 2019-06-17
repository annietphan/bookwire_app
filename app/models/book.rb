class Book < ApplicationRecord
  has_many :users, through: :reviews

end
