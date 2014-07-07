class StanzaTranslation < ActiveRecord::Base
  belongs_to :stanza, inverse_of: :stanza_translations
  belongs_to :translation, inverse_of: :stanza_translations
  attr_accessible :text, :stanza_id, :translation_id
end
