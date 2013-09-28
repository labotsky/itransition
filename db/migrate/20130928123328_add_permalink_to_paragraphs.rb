class AddPermalinkToParagraphs < ActiveRecord::Migration
  def change
    add_column :paragraphs, :permalink, :string    
  end
end
