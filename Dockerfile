FROM matomo:latest

MAINTAINER Clément Bourgoin

# Install system dependencies
RUN apt-get update && apt-get install -y unzip

# Install marketing campaign plugin
RUN curl -o MarketingCampaignsReportingPlugin.zip \
      https://plugins.matomo.org/api/2.0/plugins/MarketingCampaignsReporting/download/latest \
      && unzip MarketingCampaignsReportingPlugin.zip \
      && rm MarketingCampaignsReportingPlugin.zip \
      && mv MarketingCampaignsReporting /usr/src/piwik/plugins

# Copy Matomo configuration
COPY config.ini.php /usr/src/piwik/config/config.ini.php

