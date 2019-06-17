class Club < ApplicationRecord
  has_many :books, inverse_of: :club
  has_many :users, through: :books
  validates :name, presence: true
  validates :genre, presence: true
  validates :description, presence: true

  accepts_nested_attributes_for :books, reject_if: proc { |attributes| attributes[:name].blank?}, allow_destroy: true

end
