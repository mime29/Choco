class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.text :title
      t.text :description
      t.text :file
      t.references :gallery

      t.timestamps
    end

    add_index :arts, :gallery_id
  end
end
