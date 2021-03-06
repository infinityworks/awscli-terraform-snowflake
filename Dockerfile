FROM hashicorp/terraform:0.13.2 as terraform
FROM amazon/aws-cli:2.0.46

RUN yum install -y python3 tar gzip unzip
COPY --from=terraform /bin/terraform /bin/terraform

# Download and install SnowSQL and then remove the installer
RUN curl -sSf https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/1.2/linux_x86_64/snowsql-1.2.9-linux_x86_64.bash -o snowsql.bash && \
    touch $HOME/.profile && \
    SNOWSQL_DEST=/bin SNOWSQL_LOGIN_SHELL=$HOME/.profile bash snowsql.bash && rm -f snowsql.bash

