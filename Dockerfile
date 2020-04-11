# Go ahead and start with a JDK
FROM python:3.7

# Update and install system packages
RUN apt-get update -y && \
    apt-get install --no-install-recommends -y -q \
    git libpq-dev python3-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install DBT
RUN pip install dbt==0.16.0

# Set environment variables
ENV WORKSPACE=/workspace

# Set working directory
WORKDIR $WORKSPACE

# Make dbt an API
ENTRYPOINT ["dbt"]
