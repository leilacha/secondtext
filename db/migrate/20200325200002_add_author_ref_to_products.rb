class AddAuthorRefToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :author, foreign_key: true
  end
end
