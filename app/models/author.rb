# frozen_string_literal: true

# Model for Author
class Author < ApplicationRecord
  has_many :products, dependent: :destroy
  validates_presence_of :name, message: 'le nom doit être renseigné'
  validates_presence_of :bio, message: 'la bio doit être renseignée'
end
