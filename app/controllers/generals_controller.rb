class GeneralsController < ApplicationController
  def index

      @generals = General.all
  end

  def edit
    @generals = General.find(params[:id])
  end

  def update

    @generals = General.find(params[:id])
    if @generals.update_attributes(allowed_params)
      flash[:notice] = 'Información actualizada correctamente'
      redirect_to generals_path
    else
      render 'new'
    end


  end


  private
  def allowed_params
    params.require(:general).permit(:value)
  end
end
