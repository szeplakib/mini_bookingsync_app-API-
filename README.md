# Mini bookingsync app(API) :metal:

Mini bookingsync app is a sample Ruby on Rails app.
It's funtion is to be ably to book rentals.

It's client is found at: [Mini-BookingSync Client](https://github.com/szeplakib/mini_bookingsync_app-Client-)

It's API has 2 endpoints: Rentals, and Bookings
# Models

## Rental model
### Attributes
* id				(bigint)
* name			(string)
* daily_rate	(float)
* created_at	(datetime)
* updated_at	(datetime)
### Validations
#### name
* must be present
* maximum length is 255 chars
* must be unique (not case sensitive)
#### daily_rate
* can't be blank
* can't be a negative value, and must be less than, or equal to 100000000
##### Rental has many Bookings

## Booking model
### Attributes
* id				(bigint)
* rental_id		(bigint)
* start_at		(datetime)
* end_at			(datetime)
* client_email	(string)
* price			(float)
* created_at	(datetime)
* updated_at	(datetime)
### Validations
#### start_at & end_at
* the dates must be present
* start_at must be before end_at
* the date for that Rental must be available
#### client_email
* must be present
* must be in valid email format
* maximum length is 255 chars
#### price
* must be present
* can't be negative
* must be the correct price, which is: ( end_date - start_date ) * daily_price (every started day counts)
##### Booking belongs to Rental

# Controllers

The API accepts JSON-s from the client, and respondes in JSON, if there is a body.

# Endpoints, routes
```
    rental_bookings GET    /rentals/:rental_id/bookings(.:format)          bookings#index
                    POST   /rentals/:rental_id/bookings(.:format)          bookings#create
 new_rental_booking GET    /rentals/:rental_id/bookings/new(.:format)      bookings#new
edit_rental_booking GET    /rentals/:rental_id/bookings/:id/edit(.:format) bookings#edit
     rental_booking GET    /rentals/:rental_id/bookings/:id(.:format)      bookings#show
                    PATCH  /rentals/:rental_id/bookings/:id(.:format)      bookings#update
                    PUT    /rentals/:rental_id/bookings/:id(.:format)      bookings#update
                    DELETE /rentals/:rental_id/bookings/:id(.:format)      bookings#destroy
            rentals GET    /rentals(.:format)                              rentals#index
                    POST   /rentals(.:format)                              rentals#create
         new_rental GET    /rentals/new(.:format)                          rentals#new
        edit_rental GET    /rentals/:id/edit(.:format)                     rentals#edit
             rental GET    /rentals/:id(.:format)                          rentals#show
                    PATCH  /rentals/:id(.:format)                          rentals#update
                    PUT    /rentals/:id(.:format)                          rentals#update
                    DELETE /rentals/:id(.:format)                          rentals#destroy
           bookings GET    /bookings(.:format)                             bookings#index_all
  bookings_by_email GET    /bookings_by_email(.:format)                    bookings#index_by_email

```
* Ruby version: 2.5.0

* Rails version: 5.1.6

* Database: Postgresql: 10.3

* The required gems are listed in in the gem file
