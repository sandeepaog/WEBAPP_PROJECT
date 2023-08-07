# Use an official Python runtime as a base image
FROM python:3.9-slim

# Set environment variables for Python buffering and unbuffered output
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /webapp

# Copy the requirements.txt file and install dependencies
COPY requirements.txt /webapp/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
COPY . /webapp/

# Expose the port on which the Django development server runs (default: 8000)
EXPOSE 8000

# Command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
