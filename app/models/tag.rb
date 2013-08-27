class Tag < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :tagships
  has_many :poems, through: :tagships, :source => :taggable,  :source_type => 'Poem'
  has_many :paragraphs, through: :tagships, :source => :taggable, :source_type => 'Paragraph'


  def self.tag_counts
    Tag.select("tags.id, tags.name,count(tagships.tag_id) as count").
      joins(:tagships).group("tagships.tag_id, tags.id, tags.name")
  end  
end
