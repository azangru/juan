class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :number
      t.text :text
      t.references :annotator

      t.timestamps
    end
    add_index :comments, :annotator_id
  end
end
