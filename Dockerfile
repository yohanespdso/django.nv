# FROM specify the underlying operating system you will use to build the image
FROM python:3-alpine3.15

# WORKDIR set the default working directory
WORKDIR /app

# COPY startup script
COPY . .

# RUN any required dependencies by running the necessary commands
RUN apk add --no-cache gawk sed bash grep bc coreutils \
    && pip install -r requirements.txt \
    && chmod +x run.sh

# EXPOSE port 8000 for communication to/from server
EXPOSE 8000

# CMD specifies the command to be executed when the container starts
CMD ["/app/run.sh"]
