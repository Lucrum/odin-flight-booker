class PassengerMailer < ApplicationMailer
  default from: "confirmations@slowpedia.com"

  def thank_you_email
    @booking = params[:booking]
    @flight = params[:booking].flight
    @passenger = params[:passenger]

    mail(to: @passenger.email, subject: "Booking Confirmation ##{@booking.id}")
  end
end
