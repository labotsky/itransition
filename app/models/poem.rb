class Poem < ActiveRecord::Base
  attr_accessible :body, :description, :name, :user_id
  has_and_belongs_to_many :categories
  belongs_to :user
end
