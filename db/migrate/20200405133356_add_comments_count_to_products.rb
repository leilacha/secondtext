class AddCommentsCountToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :comments_count, :integer
  end
end
