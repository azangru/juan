class Annotator < ActiveRecord::Base
  attr_accessible :name
  has_many :comments
end
