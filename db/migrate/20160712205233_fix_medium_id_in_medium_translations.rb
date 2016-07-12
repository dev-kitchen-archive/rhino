class FixMediumIdInMediumTranslations < ActiveRecord::Migration
  class MigrationTable < ActiveRecord::Base
    self.table_name = 'medium_translations'
  end

  def change
    MigrationTable.delete_all
    remove_column :medium_translations, :medium_id, :integer, null: false, index: true
    add_column :medium_translations, :medium_id, :uuid, null: false, index: true
    add_index :medium_translations, :medium_id
  end
end
