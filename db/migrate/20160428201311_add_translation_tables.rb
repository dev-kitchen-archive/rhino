class AddTranslationTables < ActiveRecord::Migration
  def up
    I18n.with_locale(:de) do
      Book.create_translation_table!({ title: :string, description: :text }, migrate_data: true)
      Chapter.create_translation_table!({ title: :string }, migrate_data: true)
      TwoMoviesAndText.create_translation_table!(
        {
          title: :string,
          teaser: :string,
          description1: :text,
          description2: :text,
        }, migrate_data: true)
    end

    remove_column :books, :title
    remove_column :books, :description
    remove_column :chapters, :title
    remove_column :media, :title
    remove_column :media, :teaser
  end

  def down
    Book.drop_translation_table! migrate_data: true
    Chapter.drop_translation_table! migrate_data: true
    TwoMoviesAndText.drop_translation_table! migrate_data: true
  end
end
