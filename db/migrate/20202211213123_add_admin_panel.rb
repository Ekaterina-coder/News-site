# frozen_string_literal: true

class AddAdminPanel < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do
        add_column :users, :is_admin, :string
        create_table :news_types do |t|
          t.string :type_name
          t.timestamps
        end
        create_table :news_items do |t|
          t.references :publisher, foreign_key: { to_table: :users }
          t.references :news_type
          t.string :title
          t.string :subtitle
          t.string :source_url
          t.timestamps
        end
      end

      dir.down do
        drop_table :news_items
        drop_table :news_types
        remove_column :users, :is_admin
      end
    end
  end
end
