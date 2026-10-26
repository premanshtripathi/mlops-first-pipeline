# Pull the python image from Docker Hub
# Use lightweight python image
FROM python:3.14-slim

#set the working directory inside the container
WORKDIR /app

# copy dependency list before copying application code
COPY requirements.txt .

# Install tthe dependencies
RUN pip install -r requirements.txt

# Copy application code and saved model inside /app
COPY . .

# Document the code used by the FastAPI application
EXPOSE 8000

# Start the API Server when container is ready
# 0.0.0.0 - Allows connections through the container's network interface
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]