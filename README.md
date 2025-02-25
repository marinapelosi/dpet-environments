# DPET ENVIRONMENTS

This project was created to simplify the installation of the DPET API and APP.

## Please read the documentation of each project to understand their usage, behaviour, modeling, architecture and business logic.

1. [DPET LARAVEL API](https://github.com/marinapelosi/dpet-laravel-api)
2. [DPET WEB APP](https://github.com/marinapelosi/dpet-web-app)

> Each documentation has a way to install and configure each project by itself.
> But, using DPET ENVIRONMENTS, you will shorten the installation and configuration to a single command.

Yes! A single comment will do for you:

 - clone the repositories (api+web), 
 - install dependencies, 
 - configure the database, 
 - build the environments,
 - run the web-app integrated to the running rest-api

> Feel free to install each project by itself if you want. All instructions about how to do it are in their documentation.

Please, follow the instructions to setup your environments and start using the application.

-----

# Required 

- Make
- Docker
- Docker Compose
- Docker Daemon / Desktop (if windows)
- Composer
- NPM
- YARN

-----
# Here we go!

Clone and enter into the DPET-ENVIRONMENTS repository
```
clone
```

```
cd dpet-environments
```

Do the magic
```
make install
```

Watch for the logs. If you see this message, you can access the URL through the browser

```
vue_app      |   App running at:
vue_app      |   - Local:   http://localhost:8080/
vue_app      |
vue_app      |   It seems you are running Vue CLI inside a container.
vue_app      |   Access the dev server via http://localhost:<your container's external mapped port>/
vue_app      |
```

-----

# If already installed

To up the server containers

```
make up
```

To down the server containers
```
make down
```

To refresh database configuration
```
make fresh-db
```