# frozen_string_literal: true

# Model for Author
class Author < ApplicationRecord
  has_many :products, dependent: :destroy
end
