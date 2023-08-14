# Use an official Python runtime as the base image
FROM python:3.11-slim

# Install dependencies
RUN apt update && apt -y install libssl-dev libcurl4-openssl-dev gcc zlib1g-dev libjpeg62-turbo-dev

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app/

# Install any needed packages specified in requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Expose default nut port
EXPOSE 9000

# Specify the command to run your Python script
CMD ["python3", "nut.py", "-CSsor", "--move"]
