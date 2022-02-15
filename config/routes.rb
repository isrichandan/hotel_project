Rails.application.routes.draw do
  resources :rooms
  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :bookings do
    member do
      get 'download_pdf'
    end

    collection do
      get 'all_bookings'
    end  
  end    
  #get 'booking' => 'booking#index'
  root to: 'bookings#index'
  #root to: 'rooms#index'

namespace :api, defaults: {format: 'json'} do
namespace :v1 do

resources :rooms
end
end

end
