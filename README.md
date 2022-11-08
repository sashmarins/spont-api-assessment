# README
Ruby version 2.7.6 and rails version 2.7.8.1

If these are not installed, instructions can be found here: https://gorails.com/setup/macos/12-monterey

--INITIALIZATION
To initialize the project, simply clone the project and in the parent directory run ```bundle install```, then, if you would like, modify the database.yml file (I left it default). After the database.yml file is to your liking, run ```rails db:create db:migrate db:seeed``` and you should be able to view 25 users, 12 categories, and a random number of blog posts each with a random number of unique categories. If you would like to modify this, prior to running ```rails db:seed``` configure the seed.rb file to your liking. Then, run ```rails s``` to start the server locally.

--- ENDPOINTS
Using Postman, after the server is running, the following endpoints are available

GET: 

https://3000/blogs.json - retrieves a list of all blogs 

https://3000/blogs/{id}.json - retrieves a blog by id

these both do not show all the information due to how I scaffolded the project -- easy fix

PUT/PATCH:

https://3000/blogs/{id}.json - updates a blog with specific id, also returning the updated blog

{
    "title": "newTitle",
    "content": "newContent",
    "user_id": 6
}

would be an example of a valid body to pass in for these endpoints

POST:

https://3000/blogs.json - creates a new blog post with the desired body

{
    "title": "exampleTitle",
    "content": "exampleContent",
    "user_id": 23
}

is an example of a valid body to pass in for this endpoint

DELETE:

https://3000/blogs/{id}.json - deletes a blog with specific ID

no endpoints interact with categories, the join table exists but does not have any endpoint interaction

* How to run the test suite

Navigate to the 'spont-api-testing' directory within the main directory. in the integrated terminal, run ```npm install``` . If everything installed correctly, and the server is running, you should then be able to run ```npx mocha order_test.js``` to reveal one failing test. 

things missing:

-proper functionality of get endpoints

-integration of join table in the api to reveal categories of each blog
