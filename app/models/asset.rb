class Asset < ActiveRecord::Base
    belongs_to :service
      mount_uploader :file, FileUploader
end
