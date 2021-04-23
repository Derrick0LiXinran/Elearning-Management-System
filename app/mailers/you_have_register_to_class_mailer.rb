class YouHaveRegisterToClassMailer < ApplicationMailer
  def you_have_register_to_class_email
    @student = Student.find(params[:student])
    #@one_time_password = params[:password]
    mail(to: @student.email, subject: "You Have Been Registered For A Class")
  end
end
