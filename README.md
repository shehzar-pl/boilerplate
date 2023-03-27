# API Boilerplate for Rails 

This is a boilerplate for building APIs using Ruby on Rails with some common features already implemented. It uses Devise gem for authentication, ActiveAdmin gem for admin panel, dotenv-rails gem for storing environment variables and omniauth gem for social media authentication (Google, Facebook).

## Features

- Login
- Signup
- Forgot Password
- Reset Password
- Remember Me
- Signup with Google
- Signup with Facebook
- Two Factor Authentication to verify your account
- Emails Integration for Reseting Password, OTP Verification
- Admin Panel
- CRUD Operations for Models inside Admin Panel
- Filteration ability for Models inside Admin Panel

## Libraries Used

This boilerplate uses the following libraries:

**Devise** gem 
for Authentication

**ActiveAdmin** gem 
for Admin Panel

**dotenv-rails** gem 
for storing environment variables

**omniauth** gem 
for Social Media Authentication (Google, Facebook)
## How to run

### Pre Requisite
- Rails 7
- Ruby 3.0.2
- Postgres Database

0. Make sure you have prerequisites installed in your machine
1. Clone this repo in your local machine
2. run `bundle install`
3. run `rails db:create`
4. run `rails db:migrate`
5. run `rails db:seed`
6. run `rails server`
7. go to http://localhost:3000/

### Admin Panel 

Go to: http://localhost:3000/admin

You can add new integrated models directly into the admin panel by running

`rails g active_admin:install ModelName`

Running this you'll get all CRUD operations for this model along with Filteration ability on multiple parameters
