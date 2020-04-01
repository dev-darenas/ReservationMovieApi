RSpec.describe 'Reservations Request', type: :request do
  context 'creation' do
    describe "reservations" do
      let(:movie) { create(:movie) }
      let(:movie_with_reservation) { create(:with_reservations, reservations_count: 9) }
      let(:movie_with_10_reservation) { create(:with_reservations, reservations_count: 10) }
      let(:reservations_attr) { attributes_for(:reservation, movie_id: movie.id, customer: nil) }

      before do
        reservations_attr[:customer_attributes] = attributes_for(:customer)
      end

      it "should create with full data" do
        post '/api/v1/reservations.json', params: reservations_attr

        expect(JSON.parse(response.body)['value']['movie_id']).to eq(movie.id)
        expect(response).to have_http_status(:success)
      end

      it "should create, movie has 9 reservations" do
        reservations_attr[:movie_id] = movie_with_reservation.id
        post '/api/v1/reservations.json', params: reservations_attr

        expect(JSON.parse(response.body)['value']['movie_id']).to eq(movie_with_reservation.id)
        expect(response).to have_http_status(:success)
      end

      it "shouldn`t create, movie already has 10 reservations" do
        reservations_attr[:movie_id] = movie_with_10_reservation.id
        post '/api/v1/reservations.json', params: reservations_attr

        expect(JSON.parse(response.body)['value']['error']).to eq("Number reservations can't be greater than 10")
        expect(response).to have_http_status(:success)
      end

      it "dont required info, shouldn`t create reservation" do
        post '/api/v1/reservations.json'

        expect(JSON.parse(response.body)['error']).to eq("reservation_date is missing, movie_id is missing, customer_attributes is missing, customer_attributes[email] is missing, customer_attributes[name] is missing, customer_attributes[identification] is missing")
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  context 'get' do
    describe "reservations" do
      before do
        create(:with_reservations, reservations_count: 10)
      end

      it "should get 10 reservations" do
        get '/api/v1/reservations.json', params: { start_date: Date.today - 1.month, end_date: Date.today + 1.month }
        expect(JSON.parse(response.body).length).to eq(10)
      end

      it "should get error, start_date and end_date are required" do
        get '/api/v1/reservations.json'

        expect(JSON.parse(response.body)['error']).to eq("start_date is missing, end_date is missing")
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
