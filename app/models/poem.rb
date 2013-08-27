class Poem < ActiveRecord::Base
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


  def self.tagged_with(id)
    Tag.find(id).poems
  end

  # def self.tagged_with(name)
  #   Tag.find_by_name!(name).articles
  # end

  # def tag_list
  #   tags.map(&:name).join(", ")
  # end

  # def tag_list=(names)
  #   self.tags = names.split(",").map do |n|
  #     Tag.where(name: n.strip).first_or_create!
  #   end
  # end
  
end
