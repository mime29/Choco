class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.text :title
      t.text :subtitle
      t.integer :likes
      t.text :thumbnail
      t.references :portfolio

      t.timestamps
    end

    add_index :galleries, :portfolio_id
  end
end
