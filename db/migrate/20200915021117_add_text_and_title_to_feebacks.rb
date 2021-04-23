class AddTextAndTitleToFeebacks < ActiveRecord::Migration[6.0]
  def change
    add_column(:feedbacks, :text, :string)
    add_column(:feedbacks, :title, :string)
  end
end
