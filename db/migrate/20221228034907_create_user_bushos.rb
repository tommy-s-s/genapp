class CreateUserBushos < ActiveRecord::Migration[7.0]
  def change
    create_table :user_bushos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :busho, null: false, foreign_key: true
      t.date :addbusho_date
      t.date :delbusho_date
      
      t.timestamps
    end
  end
end
