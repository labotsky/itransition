class Poem < ActiveRecord::Base
  attr_accessible :body, :description, :name
  has_and_belongs_to_many :categories
end
