class PoemController < ApplicationController
  def show
    @stanza_translations = get_texts(params)
    render '/pages/text'
  end

# ===========LOGIC FOR GETTING THE REQUESTED TEXTS GOES BELOW===================

  private

# the code below is horribly unscalable (because I am assuming that there will only be three 'translations' that I hard-coded in the seed file, but what the hell)

  def get_texts(params)
    #first, get the relevant canto and its stanzas
    canto = Canto.find_by_name(params['canto'])
    @stanzas = Stanza.where(canto_id: canto.id)
    case params["view"]
    #if user wants to view a text without annotations, select the relevant translations
    when "no_annotations" # get text of the original poem or of one of its translations
      translation = Translation.find_by_name(name_of_translation_when_no_annotations(params))
      stanza_translations = @stanzas.map {|s| s.stanza_translations.find_by_translation_id(translation.id)}
    when "asimov_annotations"
      stanza_translations = @stanzas.map {|s| s.stanza_translations.find_by_translation_id(1)}
    when "parallel_texts"
      stanza_translations = parallel_texts_collection(params)
    end
    stanza_translations
  end

  def name_of_translation_when_no_annotations(params)
    case params["text"]
      when 'english_original'
        text_name = 'original'
      when 'russian_gnedich'
        text_name = 'russian-1'
      when 'russian_shengheli'
        text_name = 'russian-2'
      end
  end

  def parallel_texts_collection(params)
    stanza_translations = {}
    if params["english-original"]
      translation = Translation.find_by_name('original')
      stanza_translations[:english_original] = @stanzas.map {|s| s.stanza_translations.find_by_translation_id(translation.id)}
    end
    if params["russian-gnedich"]
      translation = Translation.find_by_author('Gnedich')
      stanza_translations[:russian_gnedich] = @stanzas.map {|s| s.stanza_translations.find_by_translation_id(translation.id)}
    end
    if params["russian-shengheli"]
      translation = Translation.find_by_author('Shengheli')
      stanza_translations[:russian_shengheli] = @stanzas.map {|s| s.stanza_translations.find_by_translation_id(translation.id)}      
    end
    stanza_translations
  end

end