class ContactMailer <  ActionMailer::Base
  def send_to_admin(params)
    @params = params
    mail(to: "nekrasovaadelina@gmail.com",
      from: params[:email],
      subject: "Blog visitor"
    )
  end
end
