class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.string :title
      t.string :description
      t.string :file
      t.references :gallery

      t.timestamps
    end

    add_index :arts, :gallery_id
  end
end
