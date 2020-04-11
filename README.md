# docker-dbt
This was inspired by https://github.com/davidgasquez/dbt-docker. There's nothing wrong with his docker images, I just had a few different requirements:
1. I wanted to use `ENTRYPOINT` so that we only have to provide the `dbt` subcommands and/or arguments
1. I wanted to publish some specific image tags, specifically `dbt-spark-0.13.0`, which is the latest version of `dbt-core` that supports Spark, and with the `dbt-spark` library already installed.
1. I wanted to use `/workspace` instead of `/dbt` in the volume because many CI/CD services automatically mount `/workspace` as a volume, and well, that makes things easy.

A docker image used for executing the Data Build Tool CLI `dbt`. The CLI is very easy to use, and doesn't really require a Docker image: my motivation for building this was I needed the ability to be able to run multiple versions of dbt.

The following environment variable is defined during the `docker build`:

```
WORKSPACE: /workspace
```

To execute the `dbt` CLI using docker from within the dbt project repository, execute the following:

```
docker run -v "$PWD":/workspace -v "$HOME/.dbt":/root/.dbt gcr.io/rpa-devops/dbt <dbt subcommand and/or arguments>
```

