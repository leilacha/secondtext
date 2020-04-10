# frozen_string_literal: true

# Model for section
class Section < ApplicationRecord
  STATUSES = %w[active shadowed].freeze
  validates :status, inclusion: { in: STATUSES }, presence: true
  validates :name, :status, presence: true
  validates :name, uniqueness: true
  has_many :products, dependent: :destroy
  has_many :authors, through: :products

  CATEGORIES = {
  	books: %w[Romans Essais Poésie],
  	movies: %w[Fiction Documentaire]
  }.freeze

  scope :active, -> { where(status: 'active') }

  def french_code
    name.downcase
  end

  def categories
  	CATEGORIES[code.to_sym]
  end
end
