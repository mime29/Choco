class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.string :subtitle
      t.integer :likes
      t.string :thumbnail
      t.references :portfolio

      t.timestamps
    end

    add_index :galleries, :portfolio_id
  end
end
