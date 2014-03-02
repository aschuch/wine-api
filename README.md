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

## Contributing

* Create something awesome, make the code better, add some functionality,
  whatever (this is the hardest part).
* [Fork it](http://help.github.com/forking/)
* Create new branch to make your changes
* Commit all your changes to your branch
* Submit a [pull request](http://help.github.com/pull-requests/)

## Contact

Feel free to get in touch.

* Website: <http://schuch.me> 
* Twitter: [@schuchalexander](http://twitter.com/schuchalexander)

## Licence

Copyright (C) 2014 Alexander Schuch

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.