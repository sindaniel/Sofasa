class PicturesController < ApplicationController
  before_action :authenticate_user!
  def index
    @pictures = Picture.all
    @tiempoGeneral = General.find_by_id(1)
    @car = Car.find(params[:car_id])


  end

  def create


    @car = Picture.find_by_id(params[:car_id])

    @picture = Picture.new(allowed_params)

    @picture.car_id = params[:car_id]
    flash[:notice] = 'Información creada correctamente'
    if @picture.save
      redirect_to car_pictures_path(params[:car_id])
    else
      render 'new'
    end






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
    params.require(:picture).permit(:time, :picture1, :picture2, :position1, :position2)
  end
end
