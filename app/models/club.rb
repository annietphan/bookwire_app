class Club < ApplicationRecord
  has_many :books, inverse_of: :club
  has_many :users, through: :books

  accepts_nested_attributes_for :books, reject_if: proc { |attributes| attributes[:name].blank?}

end
