# docker-dbt
A docker image used for executing the Data Build Tool CLI `dbt`. The CLI is very easy to use, and doesn't really require a Docker image: my motivation for building this was I needed the ability to be able to run multiple versions of dbt.

The following environment variables are defined during the `docker build`:

```
DBT_DIR: /dbt
WORKSPACE: /workspace
```

To execute the `dbt` CLI using docker from within the dbt project repository, execute the following:

```
docker run -v "$PWD":/workspace -v "$HOME/.dbt":/root/.dbt redpillanalytics/dbt <dbt subcommand and/or arguments>
```

