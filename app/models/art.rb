class Art < ActiveRecord::Base
  attr_accessible :description, :file, :title, :gallery_id
  belongs_to :gallery

  validates :title,  :presence => true
  validates :file,  :presence => true
end
