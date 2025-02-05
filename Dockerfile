FROM python:3

# Install python3-distutils
RUN apt-get update && apt-get install -y python3-distutils

WORKDIR /data

# Install Django 3.2
RUN pip install django==3.2

# Copy application code to the container
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose port 8000 for the application
EXPOSE 8000

# Start Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
