# frozen_string_literal: true

# Model for products
class Product < ApplicationRecord
  validates :title, :author, :release_year, :description, :category, presence: true
  validates :title, uniqueness: { scope: :author,
                                  message: 'Le titre existe déjà pour cet auteur' }
  belongs_to :section
  belongs_to :author

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  BOOK_CATEGORIES = %w[Tout Romans Essais Poésie]
  MOVIE_CATEGORIES = %w[Tout Fiction Documentaire]
end
