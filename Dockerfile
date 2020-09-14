FROM hashicorp/terraform:0.13.2 as terraform
FROM amazon/aws-cli:2.0.46

# A git repo is a prerequisite for pre-commit which is used in CI for code linting on PR acceptance checks
RUN yum install -y git
RUN git init
RUN yum install -y python3 tar gzip unzip

RUN pip3 install pre-commit
RUN pre-commit install
COPY ./.pre-commit-config.yaml .pre-commit-config.yaml
RUN pre-commit run
COPY --from=terraform /bin/terraform /bin/terraform

# Download and install SnowSQL and then remove the installer
RUN curl -sSf https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/1.2/linux_x86_64/snowsql-1.2.9-linux_x86_64.bash -o snowsql.bash
# Download and install Snowflake Terraform Provider
RUN curl https://raw.githubusercontent.com/chanzuckerberg/terraform-provider-snowflake/v0.15.0/download.sh | bash -s -- -b $HOME/.terraform.d/plugins
RUN touch $HOME/.profile
RUN SNOWSQL_DEST=/bin SNOWSQL_LOGIN_SHELL=$HOME/.profile bash snowsql.bash && rm -f snowsql.bash
