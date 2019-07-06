FROM memcached

USER root

RUN apt-get update && apt-get install -y --no-install-recommends sasl2-bin
RUN rm -rf /var/lib/apt/lists/*

# Add scripts
# Freely adapted from https://github.com/frodenas/docker-memcached
ADD scripts /scripts
RUN chmod +x /scripts/run.sh
RUN touch /.firstrun

# Command to run
ENTRYPOINT ["/scripts/run.sh"]

# Expose listen port
EXPOSE 11211
CMD [""]