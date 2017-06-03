# Cinema to Go - Microservices architecture using Go, Docker and MongoDB

Overview
========

The Cinema to Go backend consists of 4 microservices, all of are written in Go, using MongoDB for managing the database and Docker for isolating and deploying the movie theatre ecosystem.

 * Movie Service: Provides information like movie ratings, title, etc.
 * Show Times Service: Provides information about show times.
 * Booking Service: Provides booking information. 
 * Users Service: Provides movie suggestions for users by communicating with other services.

Requirements
===========

* Docker 1.12
* Docker Compose 1.8

Add the following line in your `/etc/hosts` file:

```
127.0.0.1   movies.local bookings.local users.local showtimes.local
```

Starting services
==============================

```
docker-compose up -d
```

Stoping services
==============================

```
docker-compose stop
```

Including new changes
==============================

```
docker-compose build
```

Restore database information
==============================

**_Access to mongodb container typing:_**

```
docker exec -it cinema-db /bin/bash
```

**_Restore data typing:_**

```
/backup/restore.sh
```

**_Leave the container:_**

```
exit
```


Documentation
==============================

## User Service

A service that's used to return information about the users of Cinema to Go.

**_Routes:_**

* GET - http://users.local/users : Get all users
* POST - http://users.local/users : Create user
* DELETE - http://users.local/users/{id} : Remove user by id

## Movie Service

A service that's used to get information about a movie. It provides the movie title, rating on a scale of 1 to 10, director and other information.

**_Routes:_**

* GET - http://movies.local/movies : Get all movies
* POST - http://movies.local/movies : Create movie
* GET - http://movies.local/movies/{id} : Get movie by id
* DELETE - http://movies.local/movies/{id} : Remove movie by id

## Showtimes Service

A service that's used to get a list of movies playing on a certain date.

**_Routes:_**

* GET - http://showtimes.local/showtimes : Get all showtimes
* POST - http://showtimes.local/showtimes : Create showtime
* GET - http://showtimes.local/showtimes/{id} : Get showtime by id
* DELETE - http://showtimes.local/showtimes/{id} : Remove showtime by id

## Booking Service

A service that's used to lookup booking information for users.

**_Routes:_**

* GET - http://bookings.local/bookings : Get all bookings
* POST - http://bookings.local/bookings : Create booking