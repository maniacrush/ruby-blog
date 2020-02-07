class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :imageable_id
      t.string :imageable_type
      t.text :content

      t.timestamps
    end

    add_index :comments, [:imageable_type, :imageable_id]
  end
end
