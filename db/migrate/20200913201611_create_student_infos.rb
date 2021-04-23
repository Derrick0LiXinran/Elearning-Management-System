class CreateStudentInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :student_infos do |t|
      t.integer :major
      t.timestamps
    end
  end
end
