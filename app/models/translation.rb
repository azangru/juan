class Translation < ActiveRecord::Base
  attr_accessible :author, :language, :name, :title
  has_many :canto_translations, inverse_of: :translation
  has_many :stanza_translations, inverse_of: :translation
end
