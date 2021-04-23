class NewstudentRegisterMailer < ApplicationMailer
  def newstudent_register_email
    @student = params[:student]
    mail(to: @student.email, subject: "You are just registered!")
  end
end
