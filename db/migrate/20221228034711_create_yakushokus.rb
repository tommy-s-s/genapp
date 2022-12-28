class CreateYakushokus < ActiveRecord::Migration[7.0]
  def change
    create_table :yakushokus do |t|
      t.string :yaku_name

      t.timestamps
    end
  end
end
