class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.text :title, :limit => nil
      t.text :description, :limit => nil
      t.text :file, :limit => nil
      t.references :gallery

      t.timestamps
    end

    add_index :arts, :gallery_id
  end
end
