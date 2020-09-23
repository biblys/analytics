FROM matomo:3.14.1

# Install system dependencies
RUN apt-get update && apt-get install -y unzip

# Install marketing campaign plugin
RUN curl -o MarketingCampaignsReportingPlugin.zip \
      https://plugins.matomo.org/api/2.0/plugins/MarketingCampaignsReporting/download/3.1.1 \
      && unzip MarketingCampaignsReportingPlugin.zip \
      && rm MarketingCampaignsReportingPlugin.zip \
      && mv MarketingCampaignsReporting /usr/src/matomo/plugins

# Install environment variables plugin
RUN curl -o EnvironmentVariables.zip \
      https://plugins.matomo.org/api/2.0/plugins/EnvironmentVariables/download/3.0.0 \
      && unzip EnvironmentVariables.zip \
      && rm EnvironmentVariables.zip \
      && mv EnvironmentVariables /usr/src/matomo/plugins

# Allow to write in tmp directory
RUN mkdir -p /var/www/html/tmp \
      && chmod -R a+w /var/www/html/tmp

# Copy Matomo configuration
COPY config.ini.php /usr/src/matomo/config/config.ini.php

