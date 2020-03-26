class AddCodeAndCreatorToSections < ActiveRecord::Migration[6.0]
  def change
    add_column :sections, :code, :string
    add_column :sections, :creator, :string
  end
end
