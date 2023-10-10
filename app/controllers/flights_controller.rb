class FlightsController < ApplicationController
  def index
    # handle search params
    if search_params[:commit] == "Search"
      @flights = Flight.where(start: params[:leave].to_date.all_day,
                              departure_airport: params[:departure],
                              arrival_airport: params[:arrival])
                       .eager_load(:departure_airport)
                       .eager_load(:arrival_airport)
      @passenger_count = search_params[:passengers]
      @allow_booking = true
    else
      @flights = Flight.all.order('start')
                       .eager_load(:departure_airport)
                       .eager_load(:arrival_airport)
      @allow_booking = false
    end
    # search options
    @airports = Airport.all
    @airport_options = @airports.map { |a| [a.code, a.id] }

    @dates = Flight.distinct.order('start').pluck('start')
    @date_options = @dates.map { |d| [d.to_date, d.to_date] }
    @passenger_options = 4.times.collect { |x| [x + 1, x + 1] }
  end

  private

  def search_params
    params.permit(:commit, :departure, :arrival, :leave, :passengers)
  end
end
