FROM hashicorp/terraform:0.12.29 as terraform
FROM amazon/aws-cli:2.0.46

RUN yum install -y python3 tar gzip unzip
COPY --from=terraform /bin/terraform /bin/terraform

# Download and install SnowSQL and then remove the installer
RUN curl -sSf https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/1.2/linux_x86_64/snowsql-1.2.9-linux_x86_64.bash -o snowsql.bash && \
    touch $HOME/.profile && \
    SNOWSQL_DEST=/bin SNOWSQL_LOGIN_SHELL=$HOME/.profile bash snowsql.bash && rm -f snowsql.bash

# Download and install pinned AWS + Snowflake Terraform Providers
RUN curl https://raw.githubusercontent.com/chanzuckerberg/terraform-provider-snowflake/v0.15.0/download.sh | bash -s -- -b $HOME/.terraform.d/plugins && \
    curl https://releases.hashicorp.com/terraform-provider-aws/3.5.0/terraform-provider-aws_3.5.0_linux_amd64.zip --output $HOME/.terraform.d/plugin-cache/linux_amd64/terraform-provider-aws_v3.5.0_x5 --create-dirs
