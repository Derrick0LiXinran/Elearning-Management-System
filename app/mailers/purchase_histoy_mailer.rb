class PurchaseHistoyMailer < ApplicationMailer
  def new_purchase_histoy_email
    # @order = params[:order]
    @student = params[:student]
    # puts @student.email
    mail(to: @student.email, subject: "Feedback Received!")
  end
end
