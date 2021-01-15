# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...'
rails g scaffold User_Show favorite:boolean currently_watching:boolean current_episode:integer user:references review:references movie:references{polymorphic} show:references{polymorphic} 

rails g scaffold TV_Shows title genre plot poster length 

rails g scaffold Movies title genre plot poster length 

%rails g scaffold Reviews notes 

rails d scaffold User username password_digest first_name last_name email 
rails g scaffold User username:uniq password:digest first_name last_name email --no-test-framework
rails g scaffold Animes title status age_rating posterImage episode_count:integer episode_length:integer  


belongs_to :user
  belongs_to :review
  belongs_to :media, polymorphic: true


   has_many :user_shows, as :media, dependent: :destroy
    has_many :users, through: :user_shows
for later

rails d scaffold User_Show favorite:boolean currently_watching:boolean current_episode:integer user:references review:references mmedia:references{polymorphic} --no-test-framework