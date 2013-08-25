class Poem < ActiveRecord::Base
  validates :name, presence: true
  validates :body, presence: true
  validates :description, presence: true

  has_and_belongs_to_many :categories
  has_many :paragraphs
  belongs_to :user

  make_flaggable :like

  scope :my_poems, ->(user) {where user_id: user}

end
