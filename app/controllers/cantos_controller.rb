class CantosController < ApplicationController

  def number_of_stanzas
    number_of_stanzas = Canto.find_by_name(params[:canto_name]).stanzas.length
    respond_to do |format|
      format.json { render json: number_of_stanzas }
    end    
  end

end