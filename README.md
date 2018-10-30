# Basic Trade App
  Trade app made in Ruby on Rails from an Udemy Course.

## Ruby version
  ```sh
  ruby 2.3.4p301 (2017-03-30 revision 58214) [x86_64-linux]
  ```
## Rails version
  ```sh
  Rails 4.2.5
  ```
## Configuration
  Running the server:
  ```sh
  $ foreman start
  ```
## Dependencies
  * ImageMagick (https://www.imagemagick.org)  
  For PaperClip gem (images storage and manipulation)  
  **OBS: this process is already included on dockerfile**
  ```
  $ sudo apt-get update
  $ sudo apt-get install imagemagick
  ```
## Database creation
  ```sh
  $ rake db:create db:migrate db:seed
  ```
## Database initialization
  Only in development (will call all tasks above together):
  ```sh
  $ rake dev:setup  
  ```  
  **OBS: if "Couldn't drop db/development.sqlite3" error occur:**  
    Delete development.sqlite3 file on db folder and run the command above again  

## Entity-Relation Diagram (ERD)
![alt text](https://github.com/cacaudev/escamboapp/blob/master/erd.png)

## Nested Controllers Diagram
![alt text](https://github.com/cacaudev/escamboapp/blob/master/NestedControllerDiagram.png)

## Docker Configuration
  To build image and create container:
  ```sh
  $ git clone https://github.com/cacaudev/escamboapp.git  
  $ docker-compose up --build  
  Open app on browser: https://<virtual-machine-ip>:3000
  ```
  **OBS: If "Migrations are pending, run bin/rake db:migrate RAILS_ENV=development" error occur:**  
  
    Open two terminal instances on project folder:
    Run on terminal 1:  (to bootstrap app)  
    $ docker-compose up  
    Run on terminal 2:  (will open shell)  
    $ docker-compose exec web bash  
    Inside shell run:  
    $ rake utils:rebuild_db  
    $ exit  
    Open https://<virtual-machine-ip>:3000 again ☕.  
