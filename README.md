## INSTALL AND RUN APP

The App user ´ruby 2.6.5´ and ´Rails 6.0.2.2´, and database use Postgres and sequel

bundle install
rake db:create
rake db:migrate
rails s

To Know the routes available

```
  rails grape:routes
````

## API DOC

If you are run the app localy you can check de API doc [here](http://localhost:3000/api-docs/index.html)

DESCIRPTION: Create a new movie
TYPE: POST
URL: localhost:3000/api/v1/movies.json?
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

## Update DOC

```
  rake rswag:specs:swaggerize
```
