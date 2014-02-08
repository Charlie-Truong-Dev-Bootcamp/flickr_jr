class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_hash
      t.timestamps
    end

    create_table :photos do |t|
      t.string :file
      t.belongs_to :album
      t.timestamps
    end

    create_table :albums do |t|
      t.string :name
      t.belongs_to :user
      t.timestamps
    end

    add_index :photos, :album_id
    add_index :albums, :user_id
  end
end
