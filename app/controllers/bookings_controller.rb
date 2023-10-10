class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    if flight_params[:commit] == 'Book'
      @booking = Booking.new
      @booking.flight = Flight.find(flight_params[:selected_flight])
      flight_params[:passengers].to_i.times { @booking.passengers.build }
    else
      redirect_to root_path
    end
  end

  def create
    @booking = Booking.new(booking_params)
    p @booking.inspect

    if @booking.save
      redirect_to @booking
    else
      puts "CANNOT SAVE"
      # @flight = Flight.find(booking_params[:flights_id])
      render :new, status: :unprocessable_entity
    end
  end

  private

  def flight_params
    params.permit(:passengers, :selected_flight, :commit)
  end

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[name email])
  end
end
