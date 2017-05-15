class Service < ActiveRecord::Base
     belongs_to :user
    geocoded_by :address_map
    after_validation :geocode 
    validates :image , :presence => true
    
  end
