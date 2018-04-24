# Mini bookingsync app(API) :metal:

Mini bookingsync app is an in development Ruby on Rails app.
This example app is for booking rentals.

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

## Rental
*the rental controller already responses in JSON
## Booking

# Routes(so far)
```
GET    /rentals/:rental_id/bookings(.:format)          bookings#index
POST   /rentals/:rental_id/bookings(.:format)          bookings#create
GET    /rentals/:rental_id/bookings/new(.:format)      bookings#new
GET    /rentals/:rental_id/bookings/:id/edit(.:format) bookings#edit
GET    /rentals/:rental_id/bookings/:id(.:format)      bookings#show
PATCH  /rentals/:rental_id/bookings/:id(.:format)      bookings#update
PUT    /rentals/:rental_id/bookings/:id(.:format)      bookings#update
DELETE /rentals/:rental_id/bookings/:id(.:format)      bookings#destroy
GET    /rentals(.:format)                              rentals#index
POST   /rentals(.:format)                              rentals#create
GET    /rentals/new(.:format)                          rentals#new
GET    /rentals/:id/edit(.:format)                     rentals#edit
GET    /rentals/:id(.:format)                          rentals#show
PATCH  /rentals/:id(.:format)                          rentals#update
PUT    /rentals/:id(.:format)                          rentals#update
DELETE /rentals/:id(.:format)                          rentals#destroy
```
* Ruby version: 2.5.0

* Rails version: 5.1.6

* Database: Postgresql: 10.3

* The gems in the gem file
