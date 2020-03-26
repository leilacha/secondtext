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

  BOOK_CATEGORIES = %w[Tout Romans Essais Poésie].freeze
  MOVIE_CATEGORIES = %w[Tout Fiction Documentaire].freeze
  SORTING_ELEMS = {
    newest_first: 'Les +  récents',
    sort_by_total_likes: 'Les + likés',
    sort_by_today_likes: 'Les + likés aujourd\'hui',
    sort_by_total_comments: 'Les + commentés'
  }.freeze

  scope :newest_first, -> { order(created_at: :desc) }
  scope :sort_by_total_likes, -> { sort_by_total_likes }

  def self.sort_by_total_likes
    self.order(likes_count: :desc)
  end

  def self.sort_by_today_likes
  	ids = Like.where("created_at >= ?", Time.zone.now.beginning_of_day).pluck(:product_id)
  	where(id: ids).sort_by_total_likes
  end

  def self.sort_by_total_comments
    ids = Comment.where("created_at >= ?", Time.zone.now.beginning_of_day).pluck(:product_id)
    where(id: ids).sort_by_total_likes
  end
end
