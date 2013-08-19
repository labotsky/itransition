class Paragraph < ActiveRecord::Base
  #attr_accessible :body, :name, :poem_id
  validates :name, presence: true
  validates :body, presence: true

  belongs_to :poem
end
