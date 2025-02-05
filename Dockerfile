FROM python:3.8

# Install system dependencies
RUN apt-get update && apt-get install -y python3-distutils python3-dev

# Set the working directory
WORKDIR /data

# Create and activate a virtual environment
RUN python -m venv venv
ENV PATH="/data/venv/bin:$PATH"

# Install Django and other dependencies in the virtual environment
RUN pip install --upgrade pip
RUN pip install django==3.2

# Copy the project files into the container
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose port 8000 for the app
EXPOSE 8000

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
