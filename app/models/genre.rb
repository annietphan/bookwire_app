class Genre < ApplicationRecord
  has_many :books, inverse_of: :book
  has_many :users, through: :books


  def self.find_by_name(name)
    Genre.find_by(name: name)
  end

end
