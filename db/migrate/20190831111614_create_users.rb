class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto'
    
    create_table :users, id: :uuid do |t|
      t.string :uid, null: false
      t.text :userinfo
      t.string :headline
      t.text   :image
      t.boolean :for_self
      t.boolean :for_kids
      t.boolean :for_family
      t.boolean :for_friends
      t.boolean :for_team
      t.boolean :for_others
      t.boolean :ebook
      t.boolean :print_book
      t.boolean :stay_updated
      t.string :price_range
      t.text :metadata
      t.integer :rank, default: 1

      t.timestamps
    end
  end
end
