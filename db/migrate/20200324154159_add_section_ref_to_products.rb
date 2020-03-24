class AddSectionRefToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :section, foreign_key: true
  end
end
