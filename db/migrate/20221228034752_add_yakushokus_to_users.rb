class AddYakushokusToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :yakushoku, null: true, foreign_key: true
  end
end
