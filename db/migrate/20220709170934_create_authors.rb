class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.boolean :alive
      t.integer :number_books

      t.timestamps
    end
  end
end
