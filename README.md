# Continue From Checkpoint

[![pipeline status](https://gitlab.com/connorshea/ContinueFromCheckpoint/badges/master/pipeline.svg)](https://gitlab.com/connorshea/ContinueFromCheckpoint/commits/master)
[![coverage report](https://gitlab.com/connorshea/ContinueFromCheckpoint/badges/master/coverage.svg?job=rspec)](https://gitlab.com/connorshea/ContinueFromCheckpoint/commits/master)

This is a Rails application for tracking your video game library.

## Getting set up

Pre-requisites:
- Ruby 2.5 or 2.6
- Postgres 10.x
- ImageMagick (for images, like avatars or game covers)

Follow these instructions:

- Clone the repository with git
- If you're on Ruby 2.5, `gem install bundler` (on Ruby 2.6, bundler is included already!)
- `bundle install`
- `yarn install`
- `bundle exec rails db:create`
- `bundle exec rails db:migrate`
- Run `bundle exec rake db:seed` to seed the database with fake data (this will destroy any existing data in the database, so be careful)
  - This will create a user with the email `admin@example.com` and the password `password`, which you can use for testing purposes.
  - Alternatively, create your own user with the "Sign up" page and then check the logs in your command line to get the confirmation link.
- `bundle exec rails s` to start the server
- Visit http://localhost:3000 in your browser and you should see the base application.
- In a separate terminal window, run `ruby ./bin/webpack-dev-server` alongside the Rails server to have a webpack-dev-server instance.
  - You don't _have_ to do this for the site to work, but things will take a lot longer to load as webpack has to compile stuff from within the same process as Rails.

### Running in production locally with Docker

If you want to use Docker to test the application locally in production mode, you can do so by following these instructions:

- Make sure you have Docker and Docker Compose installed, as well as Postgres.
- Run `docker-compose up --build`.
- In another terminal window, run `docker-compose exec web bundle exec rails db:create` and then `docker-compose exec web bundle exec rails db:migrate`.
- You may also want to run `docker-compose exec --env DATABASE_CLEANER_ALLOW_REMOTE_DATABASE_URL=true DATABASE_CLEANER_ALLOW_PRODUCTION=true web bundle exec rails db:seed` to get some data in the database (the environment variables are necessary because the remote database and production environment trip database_cleaner's safeguards). Note: **NEVER RUN THIS COMMAND IN PRODUCTION FOR REAL**

Docker isn't currently used for development, you can just run the application "natively" as described in the previous section.

### GitLab CI
To update the Docker container used by GitLab CI:

- Log into the GitLab CI Docker registry with `docker login registry.gitlab.com`.
- Build the container with `docker build -f Dockerfile.ci -t registry.gitlab.com/connorshea/continuefromcheckpoint .`
- Then use `docker push registry.gitlab.com/connorshea/continuefromcheckpoint` to push the container to the GitLab Container Registry.

## Design Document

See [DESIGN_DOC.md](DESIGN_DOC.md) for the general design plan for this project.
