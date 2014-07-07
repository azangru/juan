class Canto < ActiveRecord::Base
  attr_accessible :name
  has_many :stanzas, inverse_of: :canto
  has_many :canto_translations, inverse_of: :canto
end
