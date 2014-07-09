class ContactFormsController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(params[:contact_form])
    if @contact_form.deliver
      flash.now[:notice] = 'Thank you for your message!'
    else
      render :new
      flash[:error] = 'Sorry, the message has not been sent.'
    end      
  end
end

