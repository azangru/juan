class Stanza < ActiveRecord::Base
  belongs_to :canto, inverse_of: :stanzas
  has_many :stanza_translations, inverse_of: :stanza
  attr_accessible :number, :canto_id
end
