class AssetsController < ApplicationController
     def create
    @service = Service.find params[:service_id]
    @asset = @service.assets.build asset_params

    if @asset.save
      redirect_to @service, notice: "File was successfully uploaded."
    else
      redirect_to @service, alert: "File was not uploaded."
    end
  end

  protected

  def asset_params
    params.require(:asset).permit(:file)
  end

end
