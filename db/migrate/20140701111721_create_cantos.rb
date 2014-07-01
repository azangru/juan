class CreateCantos < ActiveRecord::Migration
  def change
    create_table :cantos do |t|
      t.string :name

      t.timestamps
    end
  end
end
