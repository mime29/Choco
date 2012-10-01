class Art < ActiveRecord::Base
  attr_accessible :description, :file, :title
  belongs_to :gallery

  validates :title,  :presence => true
  validates :file,  :presence => true
end
