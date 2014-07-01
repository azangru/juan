class CreateAnnotators < ActiveRecord::Migration
  def change
    create_table :annotators do |t|
      t.string :name

      t.timestamps
    end
  end
end
