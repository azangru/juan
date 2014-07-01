class StanzaTranslation < ActiveRecord::Base
  belongs_to :stanza
  belongs_to :translation
  attr_accessible :text, :stanza_id, :translation_id
end
