# Use the official nginx image as the base image
FROM nginx:latest

# Install required packages
RUN apt-get update && \
    apt-get install -y libmaxminddb0 libmaxminddb-dev build-essential wget unzip


# Download and extract the GeoIP2 module
RUN wget https://github.com/leev/ngx_http_geoip2_module/archive/master.zip && \
    unzip master.zip && \
    rm master.zip

# Download the GeoIP2 database
COPY GeoLite2-Country.mmdb /usr/share/GeoIP/GeoLite2-Country.mmdb

# Set the working directory to nginx's configuration directory
WORKDIR /etc/nginx

# Add the GeoIP2 module to the nginx configuration
RUN sed -i '/^http {/a \    geoip2 /usr/share/GeoIP/GeoLite2-Country.mmdb;' nginx.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
