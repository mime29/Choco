class Art < ActiveRecord::Base
  attr_accessible :description, :file, :title, :gallery_id
  belongs_to :gallery
  acts_as_list

  validates :title,  :presence => true
  validates :file,  :presence => true
end
