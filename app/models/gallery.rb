class Gallery < ActiveRecord::Base
  attr_accessible :likes, :subtitle, :thumbnail, :title
  belongs_to :portfolio
  has_many :arts, :dependent => :destroy

  validates :title,  :presence => true
  validates :thumbnail,  :presence => true
  validates :subtitle,  :presence => true

end
