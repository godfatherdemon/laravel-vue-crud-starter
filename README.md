<div align="center" style="color:red;">
  <h1>SI Aplikasi</h1>
  <h2>
    Website SI Aplikasi frontends
  </h2>
</div>
<p align="center">
  <img width="300" height="auto" src="./public/images/logo.png">
</p>
<h1 align="center">SI Aplikasi</h1>
<div align="center">
  <a><img alt="license" src="https://img.shields.io/badge/license-MIT-brightgreen.svg"></a>
  <a><img alt="version" src="https://img.shields.io/badge/version-v0.15.2-yellow.svg"></a>
  <a><img alt="build" src="https://travis-ci.org/what-crud/vue-crud.svg?branch=master"></a>
  <a><img alt="PRs" src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg"></a>
  <a><img alt="Gitpod Ready-to-Code" src="https://img.shields.io/badge/Gitpod-Ready--to--Code-blue?logo=gitpod"></a>
</div>

<h4 align="center">Laravel 8 + Vue 2 + AdminLTE 3 based Curd Starter template based REST-ful CRUD system.</h4>

* Vue CRUD allows to create both a mechanism for managing a single table, as well as a CMS or extended CRM with a login system and modules
* Application built with Vue CRUD is SPA (Single Page Application) so it works much faster than apps based on Wordpress, Joomla, etc.
* Vue CRUD uses the vue along with its ecosystem (Vuex, Vuetify, etc). Enjoy the benefits of the most popular JS framework in the world.
* The application architecture is adapted to work with REST API

## Functions
Vue CRUD provides a set of utilities, from which you can compose your own application. Features included in the system can communicate with each other thanks to the use of the Vuex library. Vue CRUD includes the following elements:

## Tech Specification** | 
- Laravel 8
- Vue 2 + VueRouter + vue-progressbar + sweetalert2 + laravel-vue-pagination
- Laravel Passport
- Admin LTE 3 + Bootstrap 4 + Font Awesome 5
- PHPUnit Test Case/Test Coverage

## Authentication system** | 
  - login form (built-in communication with API, validation),
  - optional locale selection,
  - redirecting to the app,

## Features** |
- Modal based Create+Edit, List with Pagination, Delete with Sweetalert
- Login, Register, Forget+Reset Password as default auth
- Profile, Update Profile, Change Password, Avatar
- Product Management 
- User Management
- Settings: Categories, Tags
- Frontend and Backend User ACL with Gate Policy (type: admin/user)
- Simple Static Dashboard
- Developer Options for OAuth Clients and Personal Access Token
- Build with Docker



## Quick start

Do you want to test the application quickly, and you do not have an API ready? No problem, you can use the ready-made example in the **examples** folder. The API for this example is available on the internet, so you can connect to it by entering its address in the configuration file.

### Steps

1. Clone Vue CRUD:
``` console
git clone git@repo.jabarprov.go.id:diskominfo/website-si-aplikasi-frontends.git
```
2. Type following commands:
``` console
composer install
:: or
npm install
```
3. Configure your .env from .env.example
``` console
cp .env.example .env
```

...and update .env.:
``` console
Update `.env` and set your database credentials
```
4. Generate laravel Backend
``` console
php artisan key:generate
```

5. Database Migration:
``` console
php artisan migrate
:: and
php artisan db:seed
:: and
php artisan passport:install
```

6. Database Migration:
``` console
php artisan migrate
:: and
php artisan db:seed
:: and
php artisan passport:install
```

7. Your app is already running (probably at http://localhost:8080).
``` console
npm install
:: and
npm run dev
:: and
php artisan serve
```

### Install with docker

``` html
<script>
  ## Install with Docker

- `docker-compose up -d`
- `docker exec -it vue-starter /bin/bash`
- `composer install`
- `cp .env.example .env`
- `php artisan key:generate`
- `php artisan migrate`
- `php artisan db:seed`
- `php artisan passport:install`

- Application http://localhost:8008/
- Adminer for Database http://localhost:8080/
- DBhost: yourIP:3307, user: root, Password: 123456
</script>
```

## Unit Test

#### run PHPUnit

```bash
# run PHPUnit all test cases
vendor/bin/phpunit
# or Feature test only
vendor/bin/phpunit --testsuite Feature
```

#### Code Coverage Report

```bash
# reports is a directory name
vendor/bin/phpunit --coverage-html reports/
```
A `reports` directory has been created for code coverage report. Open the dashboard.html.


## API
The application requires a connection with the appropriate API. API can be created in any technology - the condition is its compliance with the Vue CRUD communication specification. If you need to create your API and do not know how to get started, and you don't mind PHP and Laravel, download or clone the <a href="https://github.com/oh-crud/laravel-crud-api" target="_blank">Laravel CRUD API</a> project.

## Documentation
To check out docs, visit :
#### <a href="https://vuejs.org/" target="_blank">vue-crud</a>.

## Contributing
If you have an idea about improving Vue CRUD, do not hesitate.

Developers interested in contributing should read the [Code of Conduct](./CODE_OF_CONDUCT.md).

## License
[MIT](https://opensource.org/licenses/MIT)

Copyright (c) 2022-present, DISKOMINFO
