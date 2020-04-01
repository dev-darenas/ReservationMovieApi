RSpec.describe 'Movies Request', type: :request do
  context 'creation' do
    describe "with all data" do
      let(:movie_attr) { attributes_for(:movie) }
      it "should create movie" do
        post '/api/v1/movies.json', params: movie_attr

        expect(JSON.parse(response.body)['value']['name']).to eq(movie_attr[:name])
        expect(response).to have_http_status(:success)
      end
    end

    describe "without data" do
      it "should get error name, start_date, end_date are required" do
        post '/api/v1/movies.json'

        expect(JSON.parse(response.body)['error']).to eq("name is missing, start_date is missing, end_date is missing")
        expect(response).to have_http_status(400)
      end

      it "should get error, start_date and end_date are required" do
        post '/api/v1/movies.json', params: { name: Faker::Name.name }

        expect(JSON.parse(response.body)['error']).to eq("start_date is missing, end_date is missing")
        expect(response).to have_http_status(400)
      end

      it "should create movie with basic data" do
        post '/api/v1/movies.json', params: attributes_for(:movie_basic_data)

        expect(response).to have_http_status(201)
      end
    end
  end

  context 'get' do
    describe "movies" do
      it "should get five movies" do
        create_list(:movie, 5)
        get '/api/v1/movies.json', params: { date: Date.today }

        expect(JSON.parse(response.body).length).to eq(5)
        expect(response).to have_http_status(:success)
      end

      it "shouldn't get movies" do
        create_list(:movie, 5)
        get '/api/v1/movies.json', params: { date: Date.today + 2.months }

        expect(JSON.parse(response.body).length).to eq(0)
        expect(response).to have_http_status(:success)
      end

      it "get" do
        create_list(:movie, 5)
        get '/api/v1/movies.json'

        expect(JSON.parse(response.body)['error']).to eq("date is missing")
        expect(response).to have_http_status(:bad_request)
      end
    end

  end
end
