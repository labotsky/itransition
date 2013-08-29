class Category < ActiveRecord::Base
  attr_accessible :name, :body, :description
  validates :name, presence: true  
  validates :description, presence: true  
  has_and_belongs_to_many :poems
end
