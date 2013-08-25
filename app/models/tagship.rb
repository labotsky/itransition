class Tagship < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :poem
  belongs_to :tag
end
