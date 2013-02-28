# Wines API Server

A simple RESTful JSON API server to manage a wine collection based on Node.js and MongoDB. Written in CoffeeScript.

## Installation

* [Install Node and npm](http://nodejs.org/download/)
* [Install MonogoDB](http://docs.mongodb.org/manual/installation/)
* Install forever

	```
$ sudo npm install -g forever
```

* Install dependencies

	```
$ cd wines
$ sudo npm install
```

This will create a ```node_modules``` folder and install all required dependencies to run the server.

## Usage

Start the server

```
$ forever -c coffee restapi.coffee 
```

Visit [http://localhost:5000](http://localhost:5000) and you should see the API landing page.

### Add records to the database

Visit [/reset](http://localhost:5000/reset) in order to prepopulate the database with some dummy records.

### Resources


#### [GET] /wines
Get an array of all wines 

```
$ curl -i -H "Content-Type: application/json" -H "Accept: application/json" http://localhost:5000/wines
```

#### [GET] /wines/:id	
  
Get details for a single wine with the given id

```
$ curl -i -H "Content-Type: application/json" -H "Accept: application/json" http://localhost:5000/wines/512df13fb5a3e50000000003
```

#### [POST] /wines
Create a new wine

```
$ curl -i -H "Content-Type: application/json" -H "Accept: application/json" -X POST -d '{"name": "Merlot", "description": "Good Wine", "rating": 5}' http://localhost:5000/wines
```

#### [PUT] /wines/:id
Update the wine with the given id

```
$ curl -i -H "Content-Type: application/json" -H "Accept: application/json" -X PUT -d '{"rating":4}' http://localhost:5000/wines/512df13fb5a3e50000000003
```

#### [DELETE]	/wines/:id
Delete the wine with the given id

```
$ curl -i -H "Content-Type: application/json" -H "Accept: application/json" -X DELETE http://192.168.0.8:5000/wines/512df13fb5a3e50000000003
```