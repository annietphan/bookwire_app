class Book < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :reviews

  has_attached_file :book_image, styles: { book_index: "250X350>", book_show: "325X475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :book_image, content_type: /\Aimage\/.*\z/

  validates :title, :author, :summary, :genre_id, :book_image, presence: true

  # scope :genre, -> (name)  { where(genre_id: name)}

  scope :ordered, -> { order('created_at DESC') }

  def self.my_books(user)
    where(user_id: user)
  end

  def self.by_genre(genre)
    where(genre_id: genre)
  end


end
