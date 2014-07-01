class CreateStanzas < ActiveRecord::Migration
  def change
    create_table :stanzas do |t|
      t.integer :number
      t.references :canto

      t.timestamps
    end
    add_index :stanzas, :canto_id
  end
end
