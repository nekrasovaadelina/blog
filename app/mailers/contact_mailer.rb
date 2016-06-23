class ContactMailer <  ActionMailer::Base
  def send_to_admin(params)
    @params = params
    mail(to: "dmitry.fedorov@flatstack.com",
      from: params[:email],
      subject: "Blog visitor"
    )
  end
end
