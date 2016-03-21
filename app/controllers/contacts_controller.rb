class ContactsController < ApplicationController
  expose(:contact) { Contact.new(params[:contact])}

  def new
  end

  def create
    if contact.deliver
      flash[:notice] = 'Thank you for your message. We will contact you soon!'
      redirect_to root_path
    else
      flash.now[:alert] = 'Cannot send message.'
      render :new
    end
  end
end
