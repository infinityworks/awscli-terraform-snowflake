# awscli-terraform-snowflake

A docker image containing awscli, terraform and snowflake.

This image is hosted in Docker Hub [here](https://hub.docker.com/r/infinityworks/awscli-terraform-snowflake/tags).

**To update:**

1. Register a Docker Hub account with IW email
2. Get access to infinityworks organisation on Docker Hub
3. Be added to the _Snowflake_ Docker Hub team to have the right push permissions
4. Use the commands below to build & push from local


# Build the image
    
    docker build -t infinityworks/awscli-terraform-snowflake:<version_goes_here> -t infinityworks/awscli-terraform-snowflake:latest .

# Scan it for vulnerabilities    
    
    docker scan infinityworks/awscli-terraform-snowflake

# Log in to GitHub container registry and push it    
[Docs to the GH Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry)

## Personal Access Token (PAT)

To access the image in a CI pipeline you'll need a PAT. Assuming you have MFA enabled on your GitHub profile you'll also need a PAT to log in to the GH registry with Docker to push the image. [This link](https://github.com/settings/tokens) should take you there. You'll need to authorise the InfinityWorks org to configure SSO for the token in order to push an image.

After creating a PAT, export it to your profile (optionally include it in your .zshrc/.bashrc file).

    echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin

You'll need to tag the image before you can push it to GitHub. List out the images and copy the ID of the version you wish to push.

    docker images

    docker tag IMAGE_ID ghcr.io/infinityworks/awscli-terraform-snowflake:latest
    docker tag IMAGE_ID ghcr.io/infinityworks/awscli-terraform-snowflake:<version_goes_here>

Push them

    docker push infinityworks/awscli-terraform-snowflake:latest
    docker push infinityworks/awscli-terraform-snowflake:<version_goes_here>

