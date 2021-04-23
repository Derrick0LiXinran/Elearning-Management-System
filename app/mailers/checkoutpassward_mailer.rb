class CheckoutpasswardMailer < ApplicationMailer
  def checkoutpassward_email
    @student = params[:student]
    @one_time_password = params[:password]
    mail(to: @student.email, subject: "Your Password!")
  end
end
