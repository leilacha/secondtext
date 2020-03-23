# frozen_string_literal: true

class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
