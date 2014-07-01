class Comment < ActiveRecord::Base
  belongs_to :annotator
  attr_accessible :number, :text, :annotator_id
end
