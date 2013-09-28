class Poem < ActiveRecord::Base
  attr_accessible :name, :body, :description, :tag_ids, :category_ids
  validates :name, presence: true
  validates :body, presence: true
  validates :description, presence: true

  has_and_belongs_to_many :categories
  has_many :paragraphs
  belongs_to :user
  has_many :tagships, as: :taggable
  has_many :tags, through: :tagships
  make_flaggable :like

  scope :my_poems, ->(user) {where user_id: user}
  before_update :set_permalink
  before_create :set_permalink

  def self.tagged_with(id)
    Tag.find(id).poems
  end

  def set_permalink
    self.permalink = name.downcase.gsub(/[^0-9a-z]+/, ' ').strip.gsub(' ', '-') if name    
  end 

  def to_param
    [self.id, self.permalink].join('-')
  end 
end
