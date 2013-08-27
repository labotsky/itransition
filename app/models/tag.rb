class Tag < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :tagships
  has_many :poems, through: :tagships,  :source_type => 'Poem'
  has_many :paragraphs, through: :tagships, :source_type => 'Paragraph'
end
