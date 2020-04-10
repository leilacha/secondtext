class Comment < ApplicationRecord
  belongs_to :product, counter_cache: true
  belongs_to :user

  validates_presence_of :body, message: 'le commentaire ne peut pas être vide'

end
