FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY Python/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt \
    && python -m spacy download en_core_web_lg \
    && python -c "import nltk; nltk.download('stopwords')"

# Copy application code and data
COPY Python/beer_recommender.py .
COPY Python/data/ data/

EXPOSE 5002
CMD ["python", "beer_recommender.py"]
