class Portfolio < ActiveRecord::Base
  attr_accessible :title
  has_many :galleries, :dependent => :destroy
  
  validates :title,  :presence => true
end
