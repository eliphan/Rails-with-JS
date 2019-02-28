Models: User, Preference, Recommendation, Game, Session
Controllers: UsersController, SessionsController, RecommendationsController, PreferencesController

Users has many preferences (do I really need a preference model?)
Users has many recommendations
Users has many games through recommendations

Recommendations has many games
Recommendations belongs to a user

Games belongs to a recommendation
Games belongs to a genre

Genres has many games
Genres has many recommendations through games
-----------------------------------------------------------------------
User can sign up, login, logout, edit their profile, delete their account.
User can only access their own account page. There will be no index of users.
User can access their recommendations in the user's profile page.
User can access their recommendations, access a specific recommendation, edit a recommendation, delete a recommendation.
-------------------------------------------------------------------------
User can create a new recommendation (new):
users/:user_id/recommendations/new
  To create a new recommendation, user has to fill out their preferences first.
  I might or might not need a preference model as I can simply have a form for recommendation in recommendations/new.

User can access the index of the recommendations (index):
users/:user_id/recommendations
  -> This will list all of the user's recommendations. User can click on each recommendation to get to the show page for that rec.
     Logged in user can access their own recommendations only.
     Not logged in user will be redirect to login page.

User can access a specific recommendation (show):
users/:user_id/recommendations/:recommendation_id
users/1/recommendations/1 <- The first recommendation of the first user
  The show page for a recommendation will list all of the titles that was recommended to the user.
  User can click on the title of the game. This will take them to the game's show page.

User can edit their recommendations (update):
users/:user_id/recommendations/:recommendation_id/edit
-> users/:user_id/edit_recommendations

User can delete a specific recommendation(delete)
-------------------------------------------------------------------------


-------------------------------------------------------------------------
The attributes of preferences: favorite games that user has played in the past (1-3 games).

The app will return a list of games recommended to them by analyzing their preferences.
The app will access the igdb database (or to parse their website?), find the matched games, return the info to the user.
 -> The app will find the game(s) with matched name, find its platform and genres, find games in the database that matched.
    (For example: A user input The Witcher 3 as the favorite game. The app will look into the database for The Witcher 3.
    The app found The Witcher 3, learned that it can be played on multiple platforms, its genres are RPG and Adventure.
    The app then look into the database for other games that can play on multiple platforms and have genre of RPG and Adventure.)
    The matched games will be stored as instances of the game model.
    In the view, the games will be iterated and listed by their titles (max 20 titles).
    User can click on the title link to the game's show page.
    The show page for a game will list its info that we gather from the igdb api.
