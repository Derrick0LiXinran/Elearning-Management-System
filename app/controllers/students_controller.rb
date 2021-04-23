class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :add_to_cart, :remove_from_cart]


  def add_to_cart
    teacher = Teacher.find_by_name(params[:teacher])
    cp = CoursePackage.create(course_id: params[:course_id], teacher_id: teacher.id, cart_id: @student.cart.id)
    @student.cart.course_packages << cp
    @student.save
    redirect_to course_catalog_student_path(@student)
  end

  def remove_from_cart
    cp = CoursePackage.find(params[:id])
    @student.cart.course_packages.delete(cp)
    redirect_to student_cart_path(current_user, cart)
  end

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
    @student.build_student_info
    @student.student_info.build_credit_card_info
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    @student.build_student_info
    @student.build_cart
    major = Major.find_by_major_name(major_params[:major_name])
    @student.student_info.major = major
    @student.student_info.build_credit_card_info
    respond_to do |format|
      if @student.student_info.save && @student.cart.save && @student.student_info.credit_card_info.save(validate: false) && @student.save
        NewstudentRegisterMailer.with(student: @student).newstudent_register_email.deliver_now

        if current_user.nil?
          format.html { redirect_to welcome_path, notice: 'Student was successfully created.' }
          format.json { render :show, status: :created, location: @student }
        elsif current_user.type == 'Admin'
          format.html { redirect_to students_path, notice: 'Student was successfully created.' }
          format.json { render :show, status: :created, location: @student }
        else
          format.html { redirect_to @student, notice: 'Student was successfully created.' }
          format.json { render :show, status: :created, location: @student }
        end
      else
        puts @student.student_info.errors.full_messages
        puts @student.errors.full_messages
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        @student.major = Major.find_by_major_name(major_params[:major_name])
        @student.save
        if current_user.type == 'Admin'
          format.html { redirect_to students_path, notice: 'Student was successfully updated.' }
          format.json { render :show, status: :ok, location: @student }
        else
          format.html { redirect_to @student, notice: 'Student was successfully updated.' }
          format.json { render :show, status: :ok, location: @student }
        end

      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :email, :password, :address, :phone_number)
    end

    def student_info_params
      params.require(:student).permit(:major)
    end

  def major_params
    params.require(:major).permit(:major_name)
  end
end



