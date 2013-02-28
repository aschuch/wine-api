#
# Development Environment settings
#
development =
  server:
    host: "localhost"
    port: 5000

  db:
    host: 'mongodb://localhost/wines'

  env: global.process.env.NODE_ENV or "development"

# //////////////////////////

#
# Production Environment settings
#
production =
  server:
    host: "localhost"
    port: 7999

  db:
    host: 'mongodb://localhost/wines'

  env: global.process.env.NODE_ENV or "development"

# //////////////////////////

exports.config = (if global.process.env.NODE_ENV is "production" then production else development)