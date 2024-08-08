## Stage Base Image
# Define a base stage that uses the official python runtime base image
FROM python:3.11-slim AS base
# Run curl for healthcheck
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    rm -rf /var/lib/apt/lists/*

# Configure the application directory
WORKDIR /usr/local/app
# Configure & Install our requirements.txt
COPY requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt




## Stage Development with Volume Mount
# Configuration for development, where it'll watch for filesystem changes
FROM base AS dev
RUN pip install watchdog
ENV FLASK_ENV=development
CMD ["python", "app.py"]




## Stage Production Stage
# Configure the final stage that will bundle the application for production
FROM base AS prod
# Copy our code from the current folder to the working directory inside the container
COPY . .
# Configure port 80 available for links and/or publish
EXPOSE 80
# Configure our command to be run when launching the container
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:80", "--log-file", "-", "--access-logfile", "-", "--workers", "4", "--keep-alive", "0"]


