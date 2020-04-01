module MovieReservation
  class Base < Grape::API

    version 'v1', using: :path
    format :json
    prefix :api
    
    mount MovieReservation::V1::Movies
    mount MovieReservation::V1::Reservations
  end
end
