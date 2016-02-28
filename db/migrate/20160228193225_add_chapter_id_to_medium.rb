class AddChapterIdToMedium < ActiveRecord::Migration
  def change
    add_reference :media, :chapter, index: true, foreign_key: true, null: false
  end
end
