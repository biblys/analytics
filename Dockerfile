FROM php:7.3-apache

MAINTAINER Clément Bourgoin

# Copy apache configuration
COPY vhost.conf /etc/apache2/sites-available/000-default.conf

# Install system dependencies
RUN apt-get update && apt-get install -y wget unzip libpng-dev

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql gd

# Install Matomo latest version
RUN wget https://builds.piwik.org/piwik.zip \
      && unzip piwik.zip \
      && chown -R www-data:www-data /var/www/html/piwik

# Install marketing campaign plugin
RUN wget https://plugins.matomo.org/api/2.0/plugins/MarketingCampaignsReporting/download/latest \
      -O MarketingCampaignsReportingPlugin.zip \
      && unzip MarketingCampaignsReportingPlugin.zip \
      && rm MarketingCampaignsReportingPlugin.zip \
      && mv MarketingCampaignsReporting /var/www/html/piwik/plugins

# Copy Matomo configuration
COPY config.ini.php /var/www/html/piwik/config/config.ini.php

