class Translation < ActiveRecord::Base
  attr_accessible :author, :language, :name, :title
  has_many :canto_translations
  has_many :stanza_translations
end
