class BookingMailer < ApplicationMailer


    def notify_booking_creation(booking_id)
        @booking = Booking.find(booking_id)
        mail(to: 'chandanpammy@gmail.com', subject: "Booking #{@booking.user_id} has been created!")
    end    

end
