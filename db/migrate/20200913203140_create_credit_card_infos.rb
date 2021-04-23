class CreateCreditCardInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_card_infos do |t|
      t.string :student_info_id
      t.string :name
      t.string :card_number
      t.string :expiration_date
      t.string :cvv
      t.timestamps
    end
  end
end
