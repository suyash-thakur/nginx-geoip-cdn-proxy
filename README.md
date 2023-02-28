# Nginx GeoIP CDN Proxy

This GitHub repository contains a custom Nginx configuration that utilizes the GeoIP module to route incoming traffic to a suitable backend server based on the country of origin. It also incorporates a caching mechanism to improve performance and reduce server load. This configuration is specifically designed for use as a CDN proxy, making it an efficient solution for serving content to users across the globe.


## Getting Started

To get started, you can either manually configure Nginx with the provided configuration file, or use the provided Dockerfile and Docker Compose file to run the CDN proxy in a containerized environment.

### Manual Configuration

To manually configure Nginx with the provided configuration file, follow these steps:

1.  Install Nginx and the GeoIP module on your server.
2.  Copy the `nginx.conf` file from this repository to your Nginx configuration directory (usually located at `/etc/nginx/`).
3.  Update the `geoip_country` directive to point to the location of your GeoIP database file.
4.  Update the `upstream` section to include the backend servers you wish to use, along with their corresponding country codes.
5.  Start/reload Nginx to apply the new configuration.

### Dockerized Environment

To run this project in a Docker container, follow the steps below:

1.  Clone the repository


`git clone https://github.com/your-username/nginx-geoip-cdn-proxy.git` 

2.  Navigate to the project directory

`cd nginx-geoip-cdn-proxy` 

3.  Build the Docker image

`docker build -t nginx-geoip-cdn-proxy .` 

4.  Run the Docker container using Docker Compose

`docker-compose up -d` 

The `-d` flag runs the container in detached mode.

#### Dockerfile

The Dockerfile is used to build the Docker image for this project. It installs the required packages, downloads and extracts the ngx_http_geoip2_module, copies the GeoIP2 database, adds the module to the nginx configuration, and exposes port 80.

To build the Docker image, run the following command in the project directory:

`docker build -t nginx-geoip-cdn-proxy .` 

#### docker-compose.yml

The docker-compose.yml file is used to define the Docker services for this project. It specifies the nginx service, sets the container name, restart policy, port mapping, volume mapping, and command to start nginx in debug mode.

To start the project using Docker Compose, run the following command in the project directory:

`docker-compose up -d` 

The `-d` flag runs the container in detached mode.

## Configuration Options

The following configuration options are available in the `nginx.conf` file:

-   `geoip_country`: Specifies the location of the GeoIP database file.
-   `upstream`: Defines the backend servers to use for each country code.
-   `proxy_cache_path`: Specifies the location and settings for the Nginx cache.
-   `proxy_cache_valid`: Defines how long cached responses should be considered valid.
-   `proxy_cache_bypass`: Defines conditions under which the cache should be bypassed.
-   `proxy_cache_revalidate`: Enables cache revalidation for stale content.
-   `proxy_cache_min_uses`: Specifies the minimum number of requests before a response is cached.
-   `proxy_cache_lock`: Enables locking of cache entries to prevent race conditions.
-   `proxy_cache_use_stale`: Defines which types of errors should be served stale content.