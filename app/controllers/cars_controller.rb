class CarsController < ApplicationController
  before_action :authenticate_user!
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def show
  end

  def edit
    @car = Car.find(params[:id])
  end

  def create

    @car = Car.new(allowed_params)
    if @car.save
      redirect_to cars_path
    else
      render 'new'
    end


  end

  def update

    @car = Car.find(params[:id])

    if @car.update_attributes(allowed_params)
      flash[:notice] = 'Información actualizada correctamente'
      redirect_to cars_path
    else
      render 'new'
    end



  end

  def destroy

    @car = Car.find(params[:id])
    if @car.destroy
      flash[:notice] = 'Información eliminada correctamente'
      redirect_to cars_path
    else
      render 'new'
    end



  end

  private
  def allowed_params
    params.require(:car).permit(:name, :code)
  end
end
