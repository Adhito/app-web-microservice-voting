# app-web-microservice-voting
Simple Demo Microservice App For Voting 2-Topics with In Memory-DB and RDMBS DB

## Running The Application With Docker Compose

Download [Docker Desktop](https://www.docker.com/products/docker-desktop) for Mac or Windows. [Docker Compose](https://docs.docker.com/compose) will be automatically installed. On Linux, make sure you have the latest version of [Compose](https://docs.docker.com/compose/install/).



The voting application uses the following framework for the ms-service

| Service       | Framework     |
| ------------- | ------------- |
| app-result    | NodeJS 18     |
| app-vote      | Flask (Python 3.1.1)  |
| app-worker    | Dotnet 7.0    |


The voting application uses the following tech for messaging & database :
| Service       | Framework     |
| ------------- | ------------- |
| Messaging    | Redis 7.4    |
| Database     | Postgre 15.8  |

To build and run the app run the following command :

```shell
docker compose up
```


To pull image and run the app run the following command :

```shell
docker compose up -f docker-compose.images.yml
```