class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  helper_method :course_find


  def register_to_course
    @teacher = Teacher.find(params[:teacher_id])
    @teacher.teacher_info.courses << Course.find(params[:id])
    @teacher.teacher_info.save
    TeacherRegisterToClassMailer.with(teacher: @teacher).teacher_register_to_class_email.deliver_now
    redirect_to teacher_index_course_path(@teacher)
  end
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
    if current_user.type == 'Student'
      student = Student.find(current_user.id)
      major = student.major
      @courses = Course.where(major: major)
    elsif current_user.type == 'Teacher'
      teacher = Teacher.find(current_user.id)
      discipline = teacher.discipline
      @courses = Course.where(discipline: discipline)
    end
  end

  def student_index
    @courses = Course.all
    if current_user.type == 'Student' || current_user.type == 'Admin'
      @student = Student.find(params[:id])
      if @student.cart.nil?
        @student.cart = Cart.new
        @student.save
      end
      major = @student.major
      @courses = Course.where(major: major)
    elsif current_user.type == 'Teacher'
      teacher = Teacher.find(current_user.id)
      discipline = teacher.discipline
      @courses = Course.where(discipline: discipline)
    end
  end

  def teacher_index
    @courses = Course.all
    if current_user.type == 'Student'
      student = Student.find(current_user.id)
      major = student.major
      @courses = Course.where(major: major)
    elsif current_user.type == 'Teacher' || current_user.type == 'Admin'
      @teacher = Teacher.find(params[:id])
      discipline = @teacher.discipline
      @courses = Course.where(discipline: discipline)
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @course.discipline = Discipline.find_by_name(discipline_params[:name])
    @course.major= Major.find_by_major_name(major_params[:major_name])

    respond_to do |format|
      if @course.save

        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        @course.discipline = Discipline.find_by_name(discipline_params[:name])
        @course.major = Major.find_by_major_name(major_params[:major_name])
        @course.save

        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    if course_find(@course)
      redirect_to courses_url, notice:'You are not allowed to destroy this course.'
    else
      @course.destroy

      respond_to do |format|
        format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

  end

  def course_find (course)
    sql = "SELECT * from courses_teacher_infos where course_id = #{course.id}"
    result = ActiveRecord::Base.connection.execute(sql)
    temp = result.to_a
    if temp.size != 0
      true
    else
      false
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:course_number, :name, :price)
    end

  def discipline_params
    params.require(:discipline).permit(:name)
  end
  def major_params
    params.require(:major).permit(:major_name)
  end
end
