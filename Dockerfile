#version: '2'
#services:
 # proxy:
  #  image: jwilder/nginx-proxy
   # container_name: cinema-nginx-proxy
    #volumes:
     # - /var/run/docker.sock:/tmp/docker.sock:ro
    #ports:
     # - "80:80"

  #movies:
   # build: ./movies
    #image: cinema/movies
    #container_name: cinema-movies
    #depends_on:
     # - db
     # - proxy
    #links:
     # - db
    #environment:
     # VIRTUAL_HOST: movies.local

 # bookings:
  #  build: ./bookings
   # image: cinema/bookings
    #container_name: cinema-bookings
    #depends_on:
     # - db
     # - proxy
    #links:
     # - db
    #environment:
     # VIRTUAL_HOST: bookings.local

 # showtimes:
  #  build: ./showtimes
   # image: cinema/showtimes
    #container_name: cinema-showtimes
   # depends_on:
    #  - db
     # - proxy
    #links:
     # - db
    #environment:
     # VIRTUAL_HOST: showtimes.local

 # users:
  #  build: ./users
   # image: cinema/users
    #container_name: cinema-users
    #depends_on:
      #- db
      #- proxy
    #links:
     # - db
   # environment:
    #  VIRTUAL_HOST: users.local

#  db:
 #   image: mongo:3.3
  #  container_name: cinema-db
   # ports:
    #  - "27017:27017"
   # volumes:
    #  - ./backup:/backup:rw

FROM ubuntu:latest

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

RUN apt-get update
RUN apt-get install mongodb-10gen

RUN mkdir -p /data/db

EXPOSE 27017
CMD ["usr/bin/mongod", "--smallfiles"]  

# app:
  #   build: ./ctgaccounts
  #   working_dir: /go/src/ctgaccounts
  #   links:
  #     - redis
  #   environment:
  #     REDIS_URL: redis:6379

  # redis:
  #   image: redis:alpine

# docker-compose run app ginkgo
