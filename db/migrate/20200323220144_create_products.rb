# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :author
      t.integer :release_year
      t.text :description
      t.string :category

      t.timestamps
    end
  end
end
