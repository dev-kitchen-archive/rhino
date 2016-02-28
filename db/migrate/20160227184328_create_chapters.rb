class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title, null: false
      t.integer :number, null: false
      t.references :book, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
