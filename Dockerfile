FROM python:3.11-slim

WORKDIR /app

COPY src/ ./src/
COPY tests/ ./tests/

RUN pip install pytest

CMD ["pytest", "tests/", "-v"]