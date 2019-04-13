# README

# The Problem

Our application has movies, seasons and episodes. Let's simplify the metadata, so it only has a title and a plot. An episode belongs to a season and a season can have N episodes, the episode also has the number of episode in the season.

Movies and seasons can be purchased (but not episodes), they have several purchase options, a purchase option has a price (2.99) and a video quality (HD or SD).

We also have users, to simplify, a user will only have an email.

A user can make a purchase of a content (movie/season) through a purchase option. When a user makes a purchase, we store it in his library, the user has up to 2 days to see the content. In his library, we only show the titles that the user has "alive" and he can see and not the expired purchases. Also, while the user has a content in his library, he can't purchase the same content again.

For instance, if the user purchases the movie '300: Rise of an Empire' and goes to his library, he will find the movie. If he tries to purchase it again, he will receive an error. 3 days after, if he goes to the library, the movie will not appear in his library and he can purchase it again.

Define and implement the following JSON REST API in Ruby:

1. An endpoint to return the movies, ordered by creation.

2. An endpoint to return the seasons ordered by creation, including the list of episodes ordered by its number.

3. An endpoint to return both movies and seasons, ordered by creation.

4. An endpoint for a user to perform a purchase of a content.

5. An endpoint to get the library of a user ordered by the remaining time to watch the content.

# Built with
* Rails - 5.2
* Ruby - 2.4.1

# API

1.An endpoint to return the movies, ordered by creation.

```
curl -X GET http://localhost:3000/api/v1/movies

[{"id":3,"title":"Codename: Hills 3","plot":"Rerum totam eum omnis placeat sunt dicta quia. Non tempore aspernatur inventore doloremque nemo ut qui nam. Qui tenetur nesciunt est voluptatem. Voluptatum eius aut sint et ut sed. Quia laboriosam expedita commodi et sunt molestiae et.","created_at":"2019-04-13T16:47:12.040Z"},{"id":2,"title":"Christmas on Chelsey Ridges 2","plot":"Rerum totam eum omnis placeat sunt dicta quia. Non tempore aspernatur inventore doloremque nemo ut qui nam. Qui tenetur nesciunt est voluptatem. Voluptatum eius aut sint et ut sed. Quia laboriosam expedita commodi et sunt molestiae et.","created_at":"2019-04-13T16:47:11.994Z"},{"id":1,"title":"The Black Rose of England 1","plot":"Rerum totam eum omnis placeat sunt dicta quia. Non tempore aspernatur inventore doloremque nemo ut qui nam. Qui tenetur nesciunt est voluptatem. Voluptatum eius aut sint et ut sed. Quia laboriosam expedita commodi et sunt molestiae et.","created_at":"2019-04-13T16:47:11.947Z"}]
```

2.An endpoint to return the seasons ordered by creation, including the list of episodes ordered by its number.

```
curl -X GET http://localhost:3000/api/v1/seasons

[{"id":1,"title":"Green Man: The Ryann Sporer Story 1","plot":"Eos non et voluptatem harum autem non eius voluptatem. Nihil ea officia autem corporis ratione eveniet eos. Voluptatum quis dignissimos qui ad consequatur cum eaque iste. Sit corporis nostrum facilis laudantium dolor.","created_at":"2019-04-13T16:47:12.092Z","episodes":[{"id":1,"title":"Ultra Dreams 1","plot":"Soluta optio aut illum accusantium rerum. In eveniet aut ea ex magni. Nemo doloremque vero odio ut. Est labore recusandae at tenetur accusamus. Sequi nam ut aut iste.","number":1,"season_id":1},{"id":2,"title":"American Man 2","plot":"Soluta optio aut illum accusantium rerum. In eveniet aut ea ex magni. Nemo doloremque vero odio ut. Est labore recusandae at tenetur accusamus. Sequi nam ut aut iste.","number":2,"season_id":1},{"id":3,"title":"The American Ninjas with a Thousand Faces 3","plot":"Soluta optio aut illum accusantium rerum. In eveniet aut ea ex magni. Nemo doloremque vero odio ut. Est labore recusandae at tenetur accusamus. Sequi nam ut aut iste.","number":3,"season_id":1}]},{"id":2,"title":"A Fistful of Ninjas 2","plot":"Eos non et voluptatem harum autem non eius voluptatem. Nihil ea officia autem corporis ratione eveniet eos. Voluptatum quis dignissimos qui ad consequatur cum eaque iste. Sit corporis nostrum facilis laudantium dolor.","created_at":"2019-04-13T16:47:12.137Z","episodes":[{"id":4,"title":"Nuclear Women 2: Son of Nuclear Women 4","plot":"Soluta optio aut illum accusantium rerum. In eveniet aut ea ex magni. Nemo doloremque vero odio ut. Est labore recusandae at tenetur accusamus. Sequi nam ut aut iste.","number":4,"season_id":2},{"id":5,"title":"Invasion of the Diaries 5","plot":"Soluta optio aut illum accusantium rerum. In eveniet aut ea ex magni. Nemo doloremque vero odio ut. Est labore recusandae at tenetur accusamus. Sequi nam ut aut iste.","number":5,"season_id":2},{"id":6,"title":"Dangerous Clash 6","plot":"Soluta optio aut illum accusantium rerum. In eveniet aut ea ex magni. Nemo doloremque vero odio ut. Est labore recusandae at tenetur accusamus. Sequi nam ut aut iste.","number":6,"season_id":2}]},{"id":3,"title":"The Beast That Came to Dinner 3","plot":"Eos non et voluptatem harum autem non eius voluptatem. Nihil ea officia autem corporis ratione eveniet eos. Voluptatum quis dignissimos qui ad consequatur cum eaque iste. Sit corporis nostrum facilis laudantium dolor.","created_at":"2019-04-13T16:47:12.141Z","episodes":[{"id":7,"title":"The Forbidden Brains from Across the Ocean 7","plot":"Soluta optio aut illum accusantium rerum. In eveniet aut ea ex magni. Nemo doloremque vero odio ut. Est labore recusandae at tenetur accusamus. Sequi nam ut aut iste.","number":7,"season_id":3},{"id":8,"title":"American Brain 8","plot":"Soluta optio aut illum accusantium rerum. In eveniet aut ea ex magni. Nemo doloremque vero odio ut. Est labore recusandae at tenetur accusamus. Sequi nam ut aut iste.","number":8,"season_id":3},{"id":9,"title":"The Green Ninja from Across the Ocean 9","plot":"Soluta optio aut illum accusantium rerum. In eveniet aut ea ex magni. Nemo doloremque vero odio ut. Est labore recusandae at tenetur accusamus. Sequi nam ut aut iste.","number":9,"season_id":3}]}]
```

3.An endpoint to return both movies and seasons, ordered by creation.

```
curl -X GET http://localhost:3000/api/v1/contents

{"movies":[{"id":1,"title":"The Black Rose of England 1","plot":"Rerum totam eum omnis placeat sunt dicta quia. Non tempore aspernatur inventore doloremque nemo ut qui nam. Qui tenetur nesciunt est voluptatem. Voluptatum eius aut sint et ut sed. Quia laboriosam expedita commodi et sunt molestiae et.","created_at":"2019-04-13T16:47:11.947Z","updated_at":"2019-04-13T16:47:11.947Z"},{"id":2,"title":"Christmas on Chelsey Ridges 2","plot":"Rerum totam eum omnis placeat sunt dicta quia. Non tempore aspernatur inventore doloremque nemo ut qui nam. Qui tenetur nesciunt est voluptatem. Voluptatum eius aut sint et ut sed. Quia laboriosam expedita commodi et sunt molestiae et.","created_at":"2019-04-13T16:47:11.994Z","updated_at":"2019-04-13T16:47:11.994Z"},{"id":3,"title":"Codename: Hills 3","plot":"Rerum totam eum omnis placeat sunt dicta quia. Non tempore aspernatur inventore doloremque nemo ut qui nam. Qui tenetur nesciunt est voluptatem. Voluptatum eius aut sint et ut sed. Quia laboriosam expedita commodi et sunt molestiae et.","created_at":"2019-04-13T16:47:12.040Z","updated_at":"2019-04-13T16:47:12.040Z"}],"seasons":[{"id":1,"title":"Green Man: The Ryann Sporer Story 1","plot":"Eos non et voluptatem harum autem non eius voluptatem. Nihil ea officia autem corporis ratione eveniet eos. Voluptatum quis dignissimos qui ad consequatur cum eaque iste. Sit corporis nostrum facilis laudantium dolor.","created_at":"2019-04-13T16:47:12.092Z","updated_at":"2019-04-13T16:47:12.092Z"},{"id":2,"title":"A Fistful of Ninjas 2","plot":"Eos non et voluptatem harum autem non eius voluptatem. Nihil ea officia autem corporis ratione eveniet eos. Voluptatum quis dignissimos qui ad consequatur cum eaque iste. Sit corporis nostrum facilis laudantium dolor.","created_at":"2019-04-13T16:47:12.137Z","updated_at":"2019-04-13T16:47:12.137Z"},{"id":3,"title":"The Beast That Came to Dinner 3","plot":"Eos non et voluptatem harum autem non eius voluptatem. Nihil ea officia autem corporis ratione eveniet eos. Voluptatum quis dignissimos qui ad consequatur cum eaque iste. Sit corporis nostrum facilis laudantium dolor.","created_at":"2019-04-13T16:47:12.141Z","updated_at":"2019-04-13T16:47:12.141Z"}]}
```

4.An endpoint for a user to perform a purchase of a content.

```
curl -X POST -H "Content-Type: application/json" -d {"purchase": {"user_id": 1,"movies": [{"id": 3,"video_quality": "HD","price": 2.99}]}} http://localhost:3000/api/v1/purchases

"id":2,"validity_starts_on":"2019-04-13","validity_expires_on":"2019-04-16","purchase_line_items":[{"id":1,"content_id":3,"content_type":"Movie","purchase_id":2,"created_at":"2019-04-13T16:56:58.365Z"}]}
```

5.An endpoint to get the library of a user ordered by the remaining time to watch the content.

```
curl -X GET http://localhost:3000/api/v1/users/1/libraries

[{"id":1,"user_id":1,"validity_starts_on":"2019-04-13","validity_expires_on":"2019-04-16","movies":[{"id":3,"title":"Codename: Hills 3","plot":"Rerum totam eum omnis placeat sunt dicta quia. Non tempore aspernatur inventore doloremque nemo ut qui nam. Qui tenetur nesciunt est voluptatem. Voluptatum eius aut sint et ut sed. Quia laboriosam expedita commodi et sunt molestiae et.","created_at":"2019-04-13T16:47:12.040Z"}],"seasons":[]}]
```

# Running Specs

```ruby
rspec

Episode
  should validate that :title cannot be empty/falsy
  should validate that :plot cannot be empty/falsy
  should validate that :number cannot be empty/falsy
  should belong to season required: true

LibraryContent
  should validate that :library_id cannot be empty/falsy
  should validate that :content_id cannot be empty/falsy
  should belong to library required: true
  should belong to content required: true

Library
  should validate that :user_id cannot be empty/falsy
  should validate that :validity_starts_on cannot be empty/falsy
  should validate that :validity_expires_on cannot be empty/falsy
  should belong to user required: true
  should have many library_contents
  should have many movies through library_contents source => content
  should have many seasons through library_contents source => content

Movie
  should validate that :title cannot be empty/falsy
  should validate that :plot cannot be empty/falsy

PurchaseLineItem
  should validate that :price cannot be empty/falsy
  should validate that :video_quality cannot be empty/falsy
  should validate that :content_id cannot be empty/falsy
  should validate that :content_type cannot be empty/falsy
  should validate that :purchase_id cannot be empty/falsy
  should belong to purchase required: true
  should belong to content required: true

Purchase
  should validate that :user_id cannot be empty/falsy
  should validate that :price cannot be empty/falsy
  should validate that :validity_starts_on cannot be empty/falsy
  should validate that :validity_expires_on cannot be empty/falsy
  should belong to user required: true
  should have many purchase_line_items

Season
  should validate that :title cannot be empty/falsy
  should validate that :plot cannot be empty/falsy
  should have many episodes

User
  should validate that :email cannot be empty/falsy

Contents API
  GET /api/v1/contents
    returns movies and episodes

Libraries API
  GET /api/v1/users/{user_id}/libraries
    given a user
      returns the library ordered by the remaining time to watch the content

Movies API
  GET /api/v1/movies
    retuns the movies ordered by creation DESC

Purchase API
  POST /api/v1/purchases
    when user is not found
      returns error message
    when user is present
      when no active content present
        allows user to purchase a content
      when user tries to purchase same content
        when content is active
          does not allow purchase and returns error message
        when content is expired
          allows to purchase the content

Seasons API
  GET /api/v1/seasons
    returns seasons including episodes ordered by its number

Finished in 0.60801 seconds (files took 4.02 seconds to load)
42 examples, 0 failures
```
