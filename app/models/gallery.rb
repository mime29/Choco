class Gallery < ActiveRecord::Base
  attr_accessible :likes, :subtitle, :thumbnail, :title, :portfolio_id, :work
  belongs_to :portfolio
  has_many :arts, :dependent => :destroy

  validates :title,  :presence => true
  validates :thumbnail,  :presence => true
  validates :subtitle,  :presence => true
  # validates :work,  :presence => true // first update the database on the server

end
