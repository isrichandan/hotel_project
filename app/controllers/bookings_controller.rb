class BookingsController < ApplicationController
    before_action :load_booking, only: ['edit', 'update', 'show', 'destroy', 'download_pdf']
    after_action :print_closing_line, only: ['download_pdf']
    layout 'new_layout', except: [:index]
    def index
        @bookings = if params[:q] && !params[:q].blank?
                       Booking.where(user: params[:q])
                    else
                        Booking.all
                    end       

    end

    def new
        @booking = Booking.new
    end
    
    def create
        @booking = Booking.new(booking_params)
        if @booking.save
        #BookingMailer.notify_booking_creation(@booking.id).deliver_now
            redirect_to bookings_path, notice: 'Booking Created!'
        else
            render 'new'
        end
    end

    def edit 
        @booking = Booking.find(params[:id])
    end

    def update
        @booking = Booking.find(params[:id])
        if @booking.update(booking_params)
            redirect_to bookings_path, notice: 'Booking updated!'
        else
            render 'edit'
        end        
    end
    
    def show
        @booking = Booking.find(params[:id])
    end
    
    def destroy
        @booking = Booking.find(params[:id])
        @booking.destroy
        redirect_to bookings_path, notice: 'Booking deleted!'
    end

    def download_pdf
        @booking = Booking.find(params[:id])
        send_file("#{Rails.root}/public/dummy.pdf",
        filename: "#{@booking.user}.pdf", 
         type: "application/pdf" )
    end    

    private

    def booking_params
        params.require(:booking).permit(:user, :arriving_date, :leaving_date, :room_id, :user_id, :main_image)
    end    

    def print_closing_line
        Rails.logger.debug "\n\n....Download PDF is completed......\n"
    end    

    def load_booking
        @booking = Booking.find(params[:id])
    end    
    
end
