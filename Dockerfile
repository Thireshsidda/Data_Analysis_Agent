# Use a minimal Python base image
FROM python:3.9-slim

# Set working directory inside the container
WORKDIR /app

# Copy requirements first for caching
COPY requirements.txt .

# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy all files into the container
COPY . .

# Expose Streamlit's default port
EXPOSE 8501

# Run the Streamlit app
# This passes the NVIDIA_API_KEY from the Hugging Face Space Secrets
CMD ["streamlit", "run", "data_analysis_agent.py", \
     "--server.port=8501", \
     "--server.address=0.0.0.0", \
     "--server.enableXsrfProtection=false"]
