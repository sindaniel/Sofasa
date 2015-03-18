class PagesController < ApplicationController
  def index


    product = Array.new
    @tiempoGeneral = General.find_by_id(1)
    @car = Car.find_by_code(params[:id])

    product.push @tiempoGeneral.value.to_i
    product1 = Array.new
    product2 = Array.new





    @restotiempo =  @tiempoGeneral.value.to_i-@car.pictures.sum(:time)

    @cuentasi =@car.pictures.count(:time)
    @cuentano = @car.pictures.count - @car.pictures.count(:time)

    if @cuentano == 0
      @cuentano = 1
    end


    @promedio = @restotiempo  / @cuentano

    @mod = @restotiempo  % @cuentano




    @car.pictures.each_with_index do |item, index|



      if !item.time.nil?

        if index == @car.pictures.size - 1 and @mod > 0
          product1.push  Array.new(['picture' => item.picture1, 'time' => item.time+@mod])
          product2.push  Array.new(['picture' => item.picture2, 'time' => item.time+@mod])
        else
          product1.push  Array.new(['picture' => item.picture1, 'time' =>item.time])
          product2.push  Array.new(['picture' => item.picture2, 'time' =>item.time])
        end

      else
        if index == @car.pictures.size - 1 and @mod > 0
          product1.push  Array.new(['picture' => item.picture1, 'time' => @promedio+1])
          product2.push  Array.new(['picture' => item.picture2, 'time' => @promedio+1])
        else
          product1.push  Array.new(['picture' => item.picture1, 'time' => @promedio])
          product2.push  Array.new(['picture' => item.picture2, 'time' => @promedio])
        end

      end

  end

    product.push product1
    product.push product2

    render json: product
  end
end
