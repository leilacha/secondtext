# frozen_string_literal: true

# Model for products
class Product < ApplicationRecord
  validates :title, uniqueness: { scope: :author, case_sensitive: false, message: 'le titre existe déjà' }
  validates_presence_of :title, message: 'le titre doit être renseigné'
  validates_presence_of :category, message: 'la catégorie doit être renseignée'
  validates_presence_of :release_year, message: 'la date de parution doit être renseignée'
  validates_presence_of :author_id, message: "l\'autrice doit être renseignée"
  validate :first_comment, on: :create

  STATUSES = %w[created published archived].freeze
  validates :status, inclusion: { in: STATUSES }, presence: true
  scope :published, -> { where(status: 'published') }
  scope :created, -> { where(status: 'created') }

  belongs_to :section
  belongs_to :author

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :comments, allow_destroy: true

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

  def first_comment
     errors.add :comments, 'le commentaire doit être renseigné' if comments.empty?
  end
end
