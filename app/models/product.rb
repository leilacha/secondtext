# frozen_string_literal: true

# Model for products
class Product < ApplicationRecord
  validates :title, :author, :release_year, :description, :category, presence: true
  validates :title, uniqueness: { scope: :author,
                                  message: 'Le titre existe déjà pour cet auteur' }
  belongs_to :section

  BOOK_CATEGORIES = %w[Romans Essais Poésie]
  MOVIE_CATEGORIES = %w[Français US Europe Asie Afrique Autre]
end
