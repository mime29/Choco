class AddTypeToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :work, :string
  end
end
