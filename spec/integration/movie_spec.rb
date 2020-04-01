require 'swagger_helper'

describe 'Reservations API' do

  path '/api/v1/movies.json?name=fast and fourius&description= about cars&start_date=01/04/2020&end_date=25/04/2020&image_url=http//url.com' do
    post 'Creates a movie' do
      tags 'Movies'
      consumes 'application/json'
      parameter name: :movie, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          image_url: { type: :string },
          start_date: { type: :string },
          end_date: { type: :string }
        },
        required: [ 'name', 'start_date', 'end_date' ]
      }

      response '201', 'movie created' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            description: { type: :string },
            image_url: { type: :string },
            start_date: { type: :date },
            end_date: { type: :date }
          },
          required: [ 'id', 'name' ]

        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end
  end

  path '/api/v1/movies.json?date=20/03/2020' do

    get 'Retrieves movies available in the date send by parameter' do
      tags 'Movies'
      produces 'application/json'
      parameter name: :date, :in => :path, :type => :string

      response '200', 'movies' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            description: { type: :string },
            image_url: { type: :string },
            start_date: { type: :string },
            end_date: { type: :string }
          },
          required: [ 'id', 'name' ]

        run_test!
      end

      response '404', 'movies not found' do
        run_test!
      end

    end
  end

  path '/api/v1/reservations.json?reservation_date=26/03/2020&movie_id=4&customer_attributes[email]=darenas+1@softdreams.co&customer_attributes[identification]=11455783&customer_attributes[name]=Camila lozano' do
    post 'Creates a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          movie_id: { type: :integer },
          reservation_date: { type: :string },
          customer_attributes: { type: :object,
            properties: {
              name: { type: :string },
              email: { type: :string },
              identification: { type: :string }
            }          
          }
        },
        required: [ 'movie_id', 'reservation_date', 'customer_attributes' ]
      }

      response '201', 'reservation created' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            movie_id: { type: :string },
            customer_id: { type: :string },
            reservation_date: { type: :string }
          },
          required: [ 'id' ]

        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end
  end

  path '/api/v1/reservations.json?start_date=21/03/2020&end_date=26/03/2020' do
    get 'Retrieves movies available in the date send by parameter' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :date, :in => :path, :type => :string

      response '200', 'movies' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            description: { type: :string },
            image_url: { type: :string },
            start_date: { type: :string },
            end_date: { type: :string }
          },
          required: [ 'id', 'name' ]

        run_test!
      end

      response '404', 'movies not found' do
        run_test!
      end

    end
  end
end
