class CantoTranslation < ActiveRecord::Base
  belongs_to :canto, inverse_of: :canto_translations
  belongs_to :translation, inverse_of: :canto_translations
  attr_accessible :title, :canto_id, :translation_id, :comment
end
