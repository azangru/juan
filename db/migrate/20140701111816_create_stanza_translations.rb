class CreateStanzaTranslations < ActiveRecord::Migration
  def change
    create_table :stanza_translations do |t|
      t.references :stanza
      t.references :translation
      t.text :text

      t.timestamps
    end
    add_index :stanza_translations, :stanza_id
    add_index :stanza_translations, :translation_id
  end
end
