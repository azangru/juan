class CreateCantoTranslations < ActiveRecord::Migration
  def change
    create_table :canto_translations do |t|
      t.string :title
      t.string :comment
      t.references :canto
      t.references :translation

      t.timestamps
    end
    add_index :canto_translations, :canto_id
    add_index :canto_translations, :translation_id
  end
end
