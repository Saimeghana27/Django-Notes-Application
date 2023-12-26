# Use an official Python runtime as the base image
FROM python:3.9

# Set environment variables
ENV PYTHONUNBUFFERED 1

# Set working directory in the container
WORKDIR /app

# Create a virtual environment
RUN python -m venv /venv

# Activate the virtual environment and upgrade pip
RUN /venv/bin/pip install --upgrade pip

# Copy requirements file and install dependencies in the virtual environment
COPY requirements.txt /app/
RUN /venv/bin/pip install -r requirements.txt

# Copy the Django application code to the container
COPY . /app/

# Expose the port the Django app runs on
EXPOSE 9000

# Define the command to run the Django development server
CMD ["/venv/bin/python", "manage.py", "runserver", "0.0.0.0:9000"]
