class CarsController < ApplicationController
    def index
        @cars = Car.all
        render json: @cars
    end

    def show
        @car = Car.find(params[:id])
        render json: @car
    end

    def new
        @car = Car.new
    end

    def create
        @car = Car.new(car_params)

        if(@car.save)
            render json: @car
        else
            render json: {status: "unsuccessful"}
        end
    end

    def edit
        @car = Car.find(params[:id])
    end

    def update
        @car = Car.find(params[:id])
        if(@car.update(car_params))
            render json: @Car
        else
            render json: {status: "unsuccessful"}
        end
    end

    private
        def car_params
            params.require(:car).permit(:year, :make, :model, :price, :person_id)
        end
end
