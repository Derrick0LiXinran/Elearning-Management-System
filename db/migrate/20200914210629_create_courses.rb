class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :courses_num
      t.string :name
      t.integer :major_id
      t.integer :discipline_id
      t.float :price
      t.integer :student_info_id
      

      t.timestamps
    end
  end
end
