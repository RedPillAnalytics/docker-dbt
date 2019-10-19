# Go ahead and start with a JDK
FROM python:3.7

# Update and install system packages
RUN apt-get update -y && \
    apt-get install --no-install-recommends -y -q \
    git libpq-dev python-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install DBT
RUN pip install dbt==0.13.0 && \
    pip install dbt-spark

# Set environment variables
ENV DBT_DIR=/dbt \
    WORKSPACE=/workspace \
    PROFILE_DIR=/root/.dbt

ENV PATH=$DBT_DIR:$PATH

# Set working directory
WORKDIR $WORKSPACE

# Make dbt an API
ENTRYPOINT ["dbt"]
