class Poem < ActiveRecord::Base
  #attr_accessible :body, :description, :name, :user_id

  validates :name, presence: true
  validates :body, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  has_and_belongs_to_many :categories
  has_many :paragraphs
  belongs_to :user

  scope :my_poems, ->(user) {where user_id: user}
end
