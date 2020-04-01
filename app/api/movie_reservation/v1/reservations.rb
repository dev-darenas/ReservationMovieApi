module MovieReservation
  module V1
    class Reservations < Grape::API
      resource :reservations do
        desc 'Return list of reservations.'
        params do
          requires :start_date, type: Date
          requires :end_date, type: Date
        end
        get do
          Reservation.range_dates(
            params[:start_date],
            params[:end_date]
          ).includes([:movie, :customer]).map(&:to_json)
        end

        desc 'Create a new reservations.'
        params do
          requires :reservation_date, type: Date
          requires :movie_id, type: String
          requires :customer_attributes, type: Hash do
            requires :email, type: String
            requires :name, type: String
            requires :identification, type: String
          end
        end
        post do
          ReservationsTransactions::Create.call(params: params)
        end
      end
    end
  end
end
