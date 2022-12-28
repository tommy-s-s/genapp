class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.string :password_digest
      t.string :remember_digest
      t.integer :emp_no
      t.boolean :admin, default: false
      t.date :join_date
      t.string :liveaddress
      t.string :station
      t.bigint :salary
      t.date :bh_date
  

      t.timestamps
    end
  end
end
