class PicturesController < ApplicationController
  before_action :authenticate_user!
  def index
    @pictures = Picture.where(car_id: params[:car_id])
    @tiempoGeneral = General.find_by_id(1)
    @car = Car.find(params[:car_id])








  end

  def create



    if params[:picture1]
      # The magic is here ;)
      cuenta = 0;
      params[:picture1].each { |image|
       # @gallery.pictures.create(image: image)
       # @gallery.pictures.create(image: image)



        @car = Picture.find_by_id(params[:car_id])

        @picture = Picture.new(allowed_params)

        @picture.car_id = params[:car_id]
        @picture.picture1 = image
        @picture.picture2 = image
        flash[:notice] = 'Información creada correctamente'
         @picture.save



      }

      redirect_to car_pictures_path(params[:car_id])

    end




#=)








  end

  def new

    @car = Car.find_by_id(params[:car_id])
    @picture = Picture.new(:car_id=>@car)




  end

  def edit
    @car = Car.find_by_id(params[:car_id])
    @picture = Picture.find(params[:id]);
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update_attributes(allowed_params)
      flash[:notice] = 'Información actualizada correctamente'
      redirect_to car_pictures_path(params[:car_id])
    else
      render 'new'
    end


  end

  def destroy
    @picture = Picture.find(params[:id])
    if @picture.destroy
      flash[:notice] = 'Información eliminada correctamente'
      redirect_to car_pictures_path(params[:car_id])
    else
      render 'new'
    end
  end


  def sort
    params[:order].each do |key,value|
      Picture.find(value[:id]).update_attribute(:priority,value[:position])
    end
    render :nothing => true
  end


  private
  def allowed_params
    params.require(:picture).permit(:time, :picture1, :picture2, :position1, :position2, :car_id)
  end
end
