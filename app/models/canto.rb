class Canto < ActiveRecord::Base
  attr_accessible :name
  has_many :stanzas
  has_many :canto_translations
end
