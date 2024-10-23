
# Auth Service

## Description

The **Auth Service** is responsible for user authentication in the Task Manager system. It provides endpoints for user registration, login, and token generation using JWT.

## Features

- User registration
- User login
- Token generation using JWT

## Technologies Used

- Ruby on Rails
- PostgreSQL
- JWT for authentication

## Requirements

- **Ruby** 3.1.0 or higher
- **Rails** 7.0.0 or higher
- **PostgreSQL** 12 or higher

## Environment Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/v8yuricoelho/auth-service.git
   cd auth-service
   ```

2. Install the dependencies:

   ```bash
   bundle install
   ```

3. Setup the database:

   ```bash
   rails db:create
   rails db:migrate
   ```

4. Set environment variables:

   Create a `.env` file in the project root with the following variables:

   ```bash
   JWT_SECRET=<your_jwt_secret>
   ```

5. Start the server:

   ```bash
   rails server
   ```

## Endpoints

- **POST /register**: Register a new user.
- **POST /login**: Log in with valid credentials and receive a JWT.
- **POST /token/validate**: Validate a JWT.

## Testing

To run tests, use the command:

```bash
rspec
```

## Related Services

- [Task Manager](https://github.com/v8yuricoelho/task-manager)
- [Scrape Service](https://github.com/v8yuricoelho/scrape-service)
- [Notification Service](https://github.com/v8yuricoelho/notification-service)
