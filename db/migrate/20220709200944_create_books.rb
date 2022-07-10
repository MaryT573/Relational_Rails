class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :publication_date
      t.boolean :fiction

      t.timestamps
    end
  end
end
