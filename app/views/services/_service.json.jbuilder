json.extract! service, :id, :name, :details, :image, :support_required, :minimum_feature_detail, :price, :file_upload, :created_at, :updated_at
json.url service_url(service, format: :json)