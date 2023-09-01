# Sentia

The versions used are Ruby 3.0.5 and Rails 7.0.7.2

The application is containerized using Docker for ease of development, testing, and deployment.

## Prerequisites

You need to have Docker and Docker Compose installed on your machine to run this application. If not, please follow the instructions in the official documentation to install them:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

1. **Clone the repository:**

    ```
    git clone https://github.com/lsamon/sentia.git
    ```

2. **Navigate to the application directory:**

    ```
    cd sentia
    ```

3. **Build the Docker images:**

    ```
    docker-compose build
    ```
4. **Start docker container:**
    ```
    docker-compose up -d
    ```

5. **Run database setup:**

    ```
    docker-compose exec web rails db:setup
    ```

## Accessing the application

After running this command, the application should be accessible at `http://localhost:3000` or `http://0.0.0.0:3000`

## Running the tests

To run the test suite:

```
docker-compose exec web rspec
```

## Accessing the Rails console

To access the Rails console:

```
docker-compose exec web rails console
```


