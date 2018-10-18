# Trade App
  Trade app made in Ruby on Rails for an Udemy Course.

## Ruby version
  ruby 2.3.4p301 (2017-03-30 revision 58214) [x86_64-linux]
    
## Rails version
  Rails 4.2.5

## Entity-Relation Diagram
![alt text](https://github.com/cacaudev/escamboapp/blob/master/erd.png)

## Configuration
  Running the server:
  ```sh
  $ foreman start
  ```
## Database creation
  ```sh
  $ rake db:create db:migrate db:seed
  ```
## Database initialization
    Only in development (will call all tasks above once):
    $ rake utils:rebuild_db  

## Docker Configurations
  ```sh
  $ git clone https://github.com/cacaudev/escamboapp.git  
  $ docker-compose up --build  
  ```
    Open in browser: https://<virtual-machine-ip>:3000  
    OBS: if "Migrations are pending, run bin/rake db:migrate RAILS_ENV=development" occur:  
      Run on terminal 1:  (to bootstrap app)  
      $ docker-compose up  
      Run on terminal 2:  (will open shell)  
      $ docker-compose exec web bash  
      Inside shell run:  
        $ rake utils:rebuild_db  
        $ exit  
    Open https://<virtual-machine-ip>:3000 again ☕.  

