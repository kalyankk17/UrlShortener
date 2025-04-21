# URL Shortening Service Overview

This project is a **URL Shortening Service** that allows users to input long URLs and receive shortened versions. The shortened URLs can then be used to redirect users to the original long URLs.

---

## Features

1. **Shorten Long URLs**:
    - Users can input a long URL and receive a shortened version.

2. **Redirect to Original URL**:
    - Shortened URLs redirect users to the original long URL.

4. **Analytics**:
    - Track the number of times a shortened URL has been accessed.

---

## Technologies Used

- **Ruby on Rails**: Backend framework for building the service.
- **Docker**: Containerization for easy setup and deployment.
- **PostgreSQL**: Database for storing URLs and analytics.

---

## Installation
To set up the project locally using Docker, follow these steps:

1. **Build the Docker Image**:
    ```bash
    docker compose build
    ```

2. **Run the Application by setting db**:
    ```bash
    docker compose run app rails db:create db:migrate
    ```


3. **Start the Application**:
    ```bash
    docke compose up
    ```

4. **Access the Application**:
    - Open your browser and navigate to `http://localhost:3000` to access the application.

---

## Demo Video

[Download the Demo Video](./path-to-demo-video/url-shortener-demo.mov)

---