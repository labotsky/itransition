class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.integer :poem_id
      t.string :name
      t.text :body
      t.timestamps
    end
  end
end
