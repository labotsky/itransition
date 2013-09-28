class AddPermalinkToPoems < ActiveRecord::Migration
  def change
    add_column :poems, :permalink, :string
  end
end
