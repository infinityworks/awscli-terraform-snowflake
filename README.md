# awscli-terraform-snowflake

A docker image containing awscli, terraform and snowflake.

This image is hosted in Docker Hub [here](https://hub.docker.com/r/infinityworks/awscli-terraform-snowflake/tags).

**To update:**

1. Register a Docker Hub account with IW email
2. Get access to infinityworks organisation on Docker Hub
3. Be added to the _Snowflake_ Docker Hub team to have the right push permissions
4. Use the commands below to build & push from local

```zsh
docker login -u <your_username_goes_here>
docker build -t infinityworks/awscli-terraform-snowflake:<version_goes_here> -t infinityworks/awscli-terraform-snowflake:latest .
docker scan infinityworks/awscli-terraform-snowflake
docker push infinityworks/awscli-terraform-snowflake 
docker push infinityworks/awscli-terraform-snowflake:<version_goes_here>
```
