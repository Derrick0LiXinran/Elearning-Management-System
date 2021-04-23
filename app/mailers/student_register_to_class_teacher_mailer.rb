class StudentRegisterToClassTeacherMailer < ApplicationMailer
  def student_register_to_class_teacher_email
    # @order = params[:order]
    @package = CoursePackage.find(params[:package])
    @student = Student.find(params[:student])
    # puts @student.email
    mail(to: @package.teacher.email, subject: "You have a student register to your class")
  end
end
