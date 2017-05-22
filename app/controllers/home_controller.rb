class HomeController < ApplicationController
  def index
  end
  
  def how3dworks
  
  end

  def googlemap
    
    
    @services =Service.all
      @hash = Gmaps4rails.build_markers(@services) do |service, marker|
  marker.lat service.latitude
  marker.lng service.longitude
  marker.infowindow service.name
  end

end  
end
