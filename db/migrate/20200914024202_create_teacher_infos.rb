class CreateTeacherInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_infos do |t|
      t.integer :teacher_id
      t.integer :discipline_id
      t.timestamps
    end
  end
end
