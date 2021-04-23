# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

disciplines = {}
disciplines['engineering'] = ['Computer Engineering', 'Mechanical Engineering']
disciplines['business'] = %w[Finance Accounting]

# create disciplines
disciplines.each_key { |key| Discipline.create(name: key) }

# create majors
disciplines.each do |discipline, major|
  major.each { |major| Major.create(major_name: major, discipline: Discipline.find_by_name(discipline)) }
end
# majors.each { |major| Major.create(name: major) }

admin = Admin.create(name: 'admin', email: 'admin@ncsu.edu', password: 'admin')

def getPastTeachers(student)
  teachers = []
  student.purchased_histories.each do |history|
    if !teachers.find(history.teacher)
      teachers.push(history.teacher)
    end
  end
  return teachers
end


# #student1 = Student.create(name: 'test', email: 'test@ncsu.edu', password: 'test')
#
# #student1.major = Major.find_by_major_name('Computer Engineering')
# #student1.save
# teacher1 = Teacher.create(name: 'testTeacher1', email: 'teachers1@ncsu.edu', password: 'pass')
#
# student2 = Student.create(name: 'test2', email: 'test2@ncsu.edu', password: 'test')
#
#
# engineering = Major.find_by_major_name('Computer Engineering')
# finance = Major.find_by_major_name('Finance')
#
# dis = Discipline.find_by_name('engineering')
# dis2 = Discipline.find_by_name('business')
# course = Course.create(name: 'course11', course_number: '437', major: engineering, discipline: dis)
# Course.create(name: 'course12', course_number: '123', major: engineering, discipline: dis)
# Course.create(name: 'course14', course_number: '123', major: finance, discipline: dis2)
#
# course2 = Course.create(name: 'course2', course_number: '517', major: finance, discipline: dis2)
#
#
#
# teacher2 = Teacher.create(name: 'testTeacher2', email: 'teachers2@ncsu.edu', password: 'pass', discipline: dis)
# teacher2.discipline = dis
# teacher2.save
# puts teacher2.discipline.name
# #history = PurchasedHistory.create(course: course, student: student, teacher: teacher1)
# history2 = PurchasedHistory.create(course: course2, student: student2, teacher: teacher2)
# #history3 = PurchasedHistory.create(course: course2, student: student, teacher: teacher2)
#
# test_student = Student.find_by_email('test@ncsu.edu')
# #test_student.cart.courses << course
#
# #student.cart.courses << course
# #student.cart.courses << course2
# #student.save
#
# student = Student.find_by_email('test@ncsu.edu')
#
#
#
# puts Major.where(major_name: 'Computer Engineering')
# c = Course.where(major: student.major)
#
# c.each { |x| puts x.name }



