class StanzasController < ApplicationController
  def index
    canto = Canto.find(params[:canto_id])
    @stanzas = canto.stanzas(include: :stanza_translations)
    @stanza_translations = @stanzas.map {|s| s.stanza_translations.find_by_translation_id(1).text}
  end

  def show
    # this method is to show one stanza (its one, two or three 'translations') in response to the stanza selection form in the nav
    # binding.pry
    canto = Canto.find(params['cantos-dropdown'])
    stanzas = Stanza.where(canto_id: canto.id)
    stanza = stanzas.find_by_number(params['stanzas-dropdown'])
    @stanza_translations = {}
    if params['english'].present?
      @stanza_translations[:english] = stanza.stanza_translations.find_by_translation_id(Translation.find_by_name(params['english']).id)
    end
    if params['ru-gnedich'].present?
      @stanza_translations[:ru_gnedich] = stanza.stanza_translations.find_by_translation_id(Translation.find_by_name(params['ru-gnedich']).id)
    end
    if params['ru-shengheli'].present?
      @stanza_translations[:ru_shengheli] = stanza.stanza_translations.find_by_translation_id(Translation.find_by_name(params['ru-shengheli']).id)
    end
    @stanza_translations
  end
end
