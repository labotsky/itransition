class Paragraph < ActiveRecord::Base
  attr_accessible :body, :name, :tag_ids, :poem_id
  validates :name, presence: true
  validates :body, presence: true

  belongs_to :poem
  has_many :tagships, as: :taggable
  has_many :tags, through: :tagships

  def self.tagged_with(id)
    Tag.find(id).paragraphs
  end
end
