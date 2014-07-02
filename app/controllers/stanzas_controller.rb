class StanzasController < ApplicationController
  def index
    canto = Canto.find(params[:canto_id])
    @stanzas = canto.stanzas(include: :stanza_translations)
    @stanza_translations = @stanzas.map {|s| s.stanza_translations.find_by_translation_id(1).text}
  end

  def show
  end
end
