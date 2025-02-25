all: up

up:
	docker-compose up --build

down:
	docker-compose down

fresh-db:
	php -d memory_limit=-1 dpet-laravel-api/artisan migrate:fresh --seed

install:
	$(MAKE) setup
	$(MAKE) run-api
	$(MAKE) run-web-app

setup:
	rm -rf dpet-laravel-api
	git clone git@github.com:marinapelosi/dpet-laravel-api.git
	cp dpet-laravel-api/.env.example dpet-laravel-api/.env
	$(MAKE) composer-setup
	composer install --working-dir=dpet-laravel-api --no-interaction --optimize-autoloader --classmap-authoritative --no-scripts
	$(MAKE) database-config
	php -d memory_limit=-1 dpet-laravel-api/artisan optimize:clear
	rm -rf dpet-web-app
	git clone git@github.com:marinapelosi/dpet-web-app.git
	cd dpet-web-app && npm install -g yarn && yarn install
	$(MAKE) up

composer-setup:
	@if ! [ -x "$$(command -v composer)" ]; then \
		echo "Composer not found. Installing..."; \
		php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
		php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
		rm composer-setup.php; \
	else \
		echo "Composer already installed."; \
	fi

database-config:
	touch dpet-laravel-api/database/database.sqlite
	chmod -R 775 dpet-laravel-api/database/
	php -d memory_limit=-1 dpet-laravel-api/artisan migrate:fresh --seed
