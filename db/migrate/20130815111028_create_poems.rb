class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.text :body

      t.timestamps
    end
  end
end
