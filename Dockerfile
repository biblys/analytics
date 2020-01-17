FROM matomo:3.13.0

MAINTAINER Clément Bourgoin

# Install system dependencies
RUN apt-get update && apt-get install -y unzip

# Install marketing campaign plugin
RUN curl -o MarketingCampaignsReportingPlugin.zip \
      https://plugins.matomo.org/api/2.0/plugins/MarketingCampaignsReporting/download/latest \
      && unzip MarketingCampaignsReportingPlugin.zip \
      && rm MarketingCampaignsReportingPlugin.zip \
      && mv MarketingCampaignsReporting /usr/src/matomo/plugins

# Install marketing campaign plugin
RUN curl -o EnvironmentVariables.zip \
      https://plugins.matomo.org/api/2.0/plugins/EnvironmentVariables/download/latest \
      && unzip EnvironmentVariables.zip \
      && rm EnvironmentVariables.zip \
      && mv EnvironmentVariables /usr/src/matomo/plugins

# Copy Matomo configuration
COPY config.ini.php /usr/src/matomo/config/config.ini.php

