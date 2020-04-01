module ReservationsTransactions
  class Create < BaseTransaction
    tee :params
    step :create_reservation

    def params(input)
      @params = input.fetch(:params)
    end

    def create_reservation(input)
      @reservation = Reservation.new(@params)
      @reservation.customer = Customer.find_or_initialize_by(@params[:customer_attributes])
      @reservation.save

      if @reservation.errors.any?
        Failure(error: @reservation.errors.full_messages.join(' | '))
      else
        Success(@reservation)
      end
    end
  end
end
