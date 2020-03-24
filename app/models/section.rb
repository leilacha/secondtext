# frozen_string_literal: true

# Model for section
class Section < ApplicationRecord
  STATUSES = %w[active shadowed].freeze
  validates :status, inclusion: { in: STATUSES }, presence: true
  validates :name, :status, presence: true
  validates :name, uniqueness: true
  has_many :products, dependent: :destroy
end
