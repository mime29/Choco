class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.text :title, :limit => nil
      t.text :subtitle, :limit => nil
      t.integer :likes
      t.text :thumbnail, :limit => nil
      t.references :portfolio

      t.timestamps
    end

    add_index :galleries, :portfolio_id
  end
end
