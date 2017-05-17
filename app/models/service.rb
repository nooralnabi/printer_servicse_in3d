class Service < ActiveRecord::Base
    mount_uploader :file_upload, FileUploader

     belongs_to :user
     has_many :assets
    geocoded_by :address_map
    after_validation :geocode 
    
    validates :image , :presence => true
    
  end
