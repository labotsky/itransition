class CategoriesPoems < ActiveRecord::Migration
  def change
    create_table :categories_poems, id: false do |t|
      t.integer :category_id
      t.integer :poem_id
    end
  end
end
