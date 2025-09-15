# Redmine Docker Setup

This project provides a Dockerized setup for running Redmine with a MySQL database. Below are the instructions to get started.

## Prerequisites

- Docker installed on your machine
- Docker Compose installed

## Project Structure

```
redmine-docker
├── docker-compose.yml
├── mysql
│   └── init.sql
├── redmine
│   └── configuration.yml
├── .env
└── README.md
```

## Getting Started

1. **Clone the Repository**

   Clone this repository to your local machine:

   ```
   git clone <repository-url>
   cd redmine-docker
   ```

2. **Configure Environment Variables**

   Create a `.env` file in the root directory and set the necessary environment variables. You can use the provided `.env.example` as a reference.

3. **Initialize the Database**

   The `mysql/init.sql` file contains SQL commands to set up the initial database structure. Ensure that it is configured correctly.

4. **Start the Services**

   Use Docker Compose to start the services:

   ```
   docker-compose up -d
   ```

   This command will start both the MySQL database and the Redmine application.

5. **Access Redmine**

   Once the services are running, you can access Redmine by navigating to `http://localhost:3000` in your web browser.

## Stopping the Services

To stop the running services, use:

```
docker-compose down
```

## Additional Information

For more details on configuring Redmine, refer to the official [Redmine documentation](https://www.redmine.org/).

## License

This project is licensed under the MIT License. See the LICENSE file for more details.