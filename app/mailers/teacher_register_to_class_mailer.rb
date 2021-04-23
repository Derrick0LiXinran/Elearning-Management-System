class TeacherRegisterToClassMailer < ApplicationMailer
  def teacher_register_to_class_email
    # @order = params[:order]
    @teacher = params[:teacher]
    # puts @student.email
    mail(to: @teacher.email, subject: "Successful Register tTo Class!")
  end
end
