class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :name
      t.string :title
      t.string :language
      t.string :author

      t.timestamps
    end
  end
end
