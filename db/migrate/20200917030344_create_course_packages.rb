class CreateCoursePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :course_packages do |t|
      t.integer :course_id
      t.integer :teacher_id
      t.integer :cart_id

      t.timestamps
    end
  end
end
