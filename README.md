# awscli-terraform-snowflake

A docker image containing awscli, terraform and snowflake.

**To update:**

1. Register a Dockerhub account with IW email
2. Get access to infinityworks organisation on Dockerhub
3. Use the commands below to push from local

```zsh
docker login -u <your_username_goes_here>
docker build -t infinityworks/awscli-terraform-snowflake:<version_goes_here> -t infinityworks/awscli-terraform-snowflake:latest .
docker image push infinityworks/awscli-terraform-snowflake
```
