class Genre < ApplicationRecord
  has_many :books
  has_many :users, through: :books

  validates :name, presence: true

  def self.find_by_name(name)
    Genre.find_by(name: name)
  end

end
