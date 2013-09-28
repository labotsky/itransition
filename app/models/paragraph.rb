class Paragraph < ActiveRecord::Base
  attr_accessible :body, :name, :tag_ids, :poem_id
  validates :name, presence: true
  validates :body, presence: true

  belongs_to :poem
  has_many :tagships, as: :taggable
  has_many :tags, through: :tagships
  before_update :set_permalink
  before_create :set_permalink

  def self.tagged_with(id)
    Tag.find(id).paragraphs
  end

  def set_permalink
    self.permalink = name.downcase.gsub(/[^0-9a-z]+/, ' ').strip.gsub(' ', '-') if name    
  end 

  def to_param
    [self.id, self.permalink].join('-')
  end   
end
