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
    translation_names = (params.collect { |k, v| v if k.include? "for_parallel"}).compact
    translation_names.each do |name|
      translation = Translation.find_by_name(name)
      @stanza_translations[name] = stanza.stanza_translations.find_by_translation_id(Translation.find_by_name(name).id)
    end
    @stanza_translations
  end
end
