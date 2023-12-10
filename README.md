# school-student-record

## Introduction

## Prerequisites
Before you begin, ensure you have both Docker and Docker Compose installed on your system. You can download them from the following links:
- Docker: [Get Docker](https://docs.docker.com/get-docker/)
- Docker Compose: [Install Docker Compose](https://docs.docker.com/compose/install/)

To run this application, follow these simple steps:

1. **Clone the repository**
    ```bash
    git clone https://github.com/piotrszczypior/school-student-record.git
    cd school-student-record
    ```

2. **Start the docker image**
    Run the following command in the root directory of the project (where `docker-compose.yml` is located):
    ```bash
    docker-compose up -d
    ```
    This command starts all the services defined in your `docker-compose.yml` file.


## Stopping the docker image
To stop and remove the containers, networks, and volumes associated with this application, run:
```bash
docker-compose down
