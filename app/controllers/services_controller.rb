class ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  
  
  
  
  # GET /services
  # GET /services.json
  def index
    @services =Service.where(user_id: current_user)
      @hash = Gmaps4rails.build_markers(@services) do |service, marker|
  marker.lat service.latitude
  marker.lng service.longitude
  marker.infowindow service.name
end
  end




  # GET /services/1
  # GET /services/1.json
  def show

    
  end

  # GET /services/new
  def new
    @service =current_user.services.build
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = current_user.services.build(service_params)
  #save file to server 
 uploaded_io =params[:service][:image]
 File.open("public/images/"+ uploaded_io.original_filename,'wb') do |file|
    file.write(uploaded_io.read)
  end
  @service.image=uploaded_io.original_filename

#end seve 


    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :details, :image, :support_required, :minimum_feature_detail, :price, :file_upload ,:address_map)
    end
end
