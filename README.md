## INSTALL AND RUN APP

The App user ´ruby 2.6.5´ and ´Rails 6.0.2.2´, and database use Postgres and sequel.

To run the app you must run in the console the follow commands

````
  bundle install  
  rake db:create  
  rake db:migrate  
  rails s  
````

now you can start to use the API to reserve and create movies

To Know the routes available run console

```
  rails grape:routes
````

## API DOC

If you are run the app localy you can check de API doc [here](http:localhost/api-docs/index.html)
to check in production API doc check [here](https://strawberry-crumble-99221.herokuapp.com/api-docs/index.html)

1. 
DESCIRPTION: Create a new movie.  
TYPE: POST.  
URL: https://strawberry-crumble-99221.herokuapp.com/api/v1/movies.json
DATA:
```
  {
    name: 'Fast and Furious',
    description: 'is an American media franchise centered on a series of action films that are largely concerned with illegal street racing, heists and spies.',
    image_url: 'https://pbs.twimg.com/profile_images/808736180074348545/tqHuSfTj_400x400.jpg',
    start_date: 01/03/2020,
    end_date: 25/03/2020
  }
````
REQUIRED: ['name', 'start_date', 'end_date']  
RESPONSE:

````
  {
    "value": {
        "id": 7,
        "name": "fast and fourius",
        "description": " about cars",
        "image_url": null,
        "start_date": "2020-04-01",
        "end_date": "2020-04-25",
        "created_at": "2020-04-01T03:41:46.597Z",
        "updated_at": "2020-04-01T03:41:46.597Z"
    }
  }
````

2. 
DESCIRPTION: Get movies available in a determinate day.  
TYPE: GET.  
URL: https://strawberry-crumble-99221.herokuapp.com/api/v1/movies.json
DATA:
```
  {
    date: 01/04/2020
  }
````
REQUIRED: []  
RESPONSE:

````
  [
    {
        "id": 5,
        "name": "nemo II",
        "description": "Is a fuby fish",
        "image_url": null,
        "start_date": "2020-03-20",
        "end_date": "2020-03-25",
        "created_at": "2020-03-31T19:39:33.041Z",
        "updated_at": "2020-03-31T19:39:33.041Z"
    },
    {
        "id": 6,
        "name": "fast and fourius",
        "description": " about cars",
        "image_url": null,
        "start_date": "2020-03-01",
        "end_date": "2020-03-25",
        "created_at": "2020-03-31T20:36:53.533Z",
        "updated_at": "2020-03-31T20:36:53.533Z"
    }
  ]
````

3. 
DESCIRPTION: Create reservation to a movie.  
TYPE: POST.  
URL: https://strawberry-crumble-99221.herokuapp.com/api/v1/reservations.json
DATA:
```
  {
    reservation_date: '26/03/2020',
    movie_id: 5,
    customer_attributes: {
      email: 'darenas+1@softdreams.co',
      identification: '11455783'
      name: 'Camila lozano'
    }
  }
````
REQUIRED: ['reservation_date', 'movie_id', 'customer_attributes']  
RESPONSE:

````
{
  "value": {
      "id": 16,
      "movie_id": 5,
      "customer_id": 3,
      "reservation_date": "2020-03-26",
      "created_at": "2020-04-01T15:49:13.181Z",
      "updated_at": "2020-04-01T15:49:13.181Z"
  }
}
````

3. 
DESCIRPTION: Get reservations in a range of dates.  
TYPE: GET.  
URL: https://strawberry-crumble-99221.herokuapp.com/api/v1/reservations.json
DATA:
```
  {
    start_date: '26/03/2020',
    end_date: '01/04/2020'
  }
````
REQUIRED: ['start_date', 'end_date']  
RESPONSE:

````
  [
    {
        "id": 1,
        "movie_id": 2,
        "customer_id": 1,
        "reservation_date": "2020-03-25",
        "created_at": "2020-03-31T22:19:03.197Z",
        "updated_at": "2020-03-31T22:19:03.197Z"
    },
    {
        "id": 2,
        "movie_id": 2,
        "customer_id": 1,
        "reservation_date": "2020-03-25",
        "created_at": "2020-03-31T22:39:41.904Z",
        "updated_at": "2020-03-31T22:39:41.904Z"
    },
    {
        "id": 3,
        "movie_id": 2,
        "customer_id": 2,
        "reservation_date": "2020-03-25",
        "created_at": "2020-03-31T22:40:10.943Z",
        "updated_at": "2020-03-31T22:40:10.943Z"
    }
  ]
````

**NOTE**: Date format id ´DD/MM/YYYY´

## Update DOC

You can check the doc olnile just enter to the url http://https://strawberry-crumble-99221.herokuapp.com/api-docs/index.html

to update the doc, enter to `spec/integration/movie_spec.rb` and run.  

```
  rake rswag:specs:swaggerize
```

## Run Test

In command line run.  

```
bundle exec rspec
```
