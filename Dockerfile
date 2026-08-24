FROM python:3.11-slim

WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 8000

# Start server using the port assigned by Render ($PORT)
CMD ["sh", "-c", "uvicorn app:app --reload --host 0.0.0.0 --port ${PORT:-8000}"]
