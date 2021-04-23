require 'rails_helper'

describe StudentsController do
  it 'renders the index template' do
    get :index
    expect(response).to render_template('index')
  end

  it 'assigns @students' do
    student = Student.new(name: 'test', email: 'test', password: 'test')
    student.build_student_info
    student.build_cart
    student.save
    get :index
    expect(assigns(:students)).to eq(Student.all)
  end

  context "GET show/:id" do
    it "renders the :show template" do
      student = Student.new(name: 'test', email: 'test', password: 'test')
      student.build_student_info
      student.build_cart
      student.save
      get :show, params: { id: student.id }
      expect(response).to render_template('show')
    end
  end

  it "renders the :new template" do
    get :new
    expect(response).to render_template('new')
  end

  it "renders the :edit template" do
    student = Student.new(name: 'test', email: 'test', password: 'test')
    student.build_student_info
    student.build_cart
    student.save
    get :edit, params: { id: student.id }
    expect(response).to render_template('edit')
  end

  it "renders the :create template" do
    post :create, params: { student: {name: 'test', email: 'test', password: 'test', address: 'test', phone_number: '123' }, major: { major_name: 'computer engineering'} }
    expect(response).to have_http_status(:ok)
  end

  it "renders the :update template" do
    student = Student.new(name: 'test', email: 'test2', password: 'test')
    student.student_info = StudentInfo.new
    student.build_cart
    #major = Major.find_by_major_name('Mechanical Engineering')
    student.student_info.major = Major.create()
    student.save
    session[:user_id] = student.id
    patch :update, params: { id: student.id, student: {name: 'test', email: 'test1', password: 'test', address: 'test', phone_number: '123' }, major: { major_name: 'Computer Engineering'} }
    expect(response).to redirect_to(student)
  end

  it "renders the :destroy template" do
    student = Student.new(name: 'test', email: 'test', password: 'test')
    student.build_student_info
    student.build_cart
    student.save
    delete :destroy, params: { id: student.id }
    expect(response).to redirect_to(students_url)
  end
end