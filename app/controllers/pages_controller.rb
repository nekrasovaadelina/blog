class PagesController < ApplicationController
  def about_us
  end

  def contact_us
    @contact = Contact.new
  end

  def contact_admin
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.send_to_admin(contact_params).deliver_now
      redirect_to root_path, notice: "Thank you for your message. We will contact you soon!"
    else
      flash.now[:alert] = "Cannot send message"
      render :contact_us
    end
  end

  def main_page
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
