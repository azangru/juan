class CantoTranslation < ActiveRecord::Base
  belongs_to :canto
  belongs_to :translation
  attr_accessible :title, :canto_id, :translation_id, :comment
end
