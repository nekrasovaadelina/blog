class PagesController < ApplicationController
  def about_us
  end

  def contact_us
    @contact = Contact.new
  end

  def contact_admin
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      ContactMailer.send_to_admin(params[:contact]).deliver_now
      redirect_to root_path, notice: "Thank you for your message. We will contact you soon!"
    else
      flash.now[:alert] = "Cannot send message"
      render :contact_us
    end
  end
end
