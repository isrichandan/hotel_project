class Api::V1::RoomsController < ActionController::API
    def index
    rooms = Room.all
    render json: {message: 'OK', rooms: rooms }.to_json, status: 200
    end
    def show
    room = Room.find(params[:id])
    if room
    render json: {message: 'OK', room: room}.to_json, status: 200
    else
    render json: {message: 'Error', error: 'Room not found with the given id'}.to_json, status: 404
    end
    rescue => e
    render json: {message: 'Error', error: e.message }.to_json, status: 500
    end

    def create
        room = Room.new(room_params)
        
        if room.save
        render json: {message: 'Created', room: room}.to_json, status: :created
         else
        render json: {message: 'Error', error: room.errors.full_messages}.to_json, status: :unprocessable_entity
       end
    end  
    

    private 

    # Only allow a list of trusted parameters through.
    def room_params
        params.require(:room).permit(:user_name, :mob, :address)
      


    end
    
end    