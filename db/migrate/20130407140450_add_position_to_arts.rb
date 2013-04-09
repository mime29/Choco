class AddPositionToArts < ActiveRecord::Migration
  def change
    add_column :arts, :position, :integer
  end
end
