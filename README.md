== README

# Notes and Tags

This is a rails backend system with two models - Note and Tag. Each Note in the backend can have 10 tags.

## Dependencies
            * Ruby Version    : 2.1.2
            * Rails           : 4.2.6
            * faker
            * kaminari-mongoid
            * rspec

## Installation
            $ git clone https://github.com/mukesh4139/notes-and-tags.git
            $ cd note-and-tags
            $ bundle install
            $ rake db:seed (optional)
            $ rails server
            
## Running Test
            $ rspec spec/controllers/
            $ rspec spec/models/


## Documentation

For Pagination, kaminari gem is used for pagination.

For Testing, rspec has been used

#### Demo App Link

https://notes-and-tags.herokuapp.com/

## Assumptions

Total number of tags has been limited to 10.

Title and Body of the note have been marked compulsory.
