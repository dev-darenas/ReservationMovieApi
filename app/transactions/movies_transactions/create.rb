module MoviesTransactions
  class Create < BaseTransaction
    tee :params
    step :create_movie

    def params(input)
      @params = input.fetch(:params)
    end

    def create_movie(input)
      @movie = Movie.create(@params)

      if @movie.errors.any?
        Failure(error: @movie.errors.full_messages.join(' | '))
      else
        Success(@movie)
      end
    end
  end
end
