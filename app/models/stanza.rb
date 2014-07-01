class Stanza < ActiveRecord::Base
  belongs_to :canto
  has_many :stanza_translations
  attr_accessible :number, :canto_id
end
