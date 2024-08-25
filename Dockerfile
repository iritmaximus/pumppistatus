FROM python:3.12-slim

RUN pip install poetry
RUN mkdir -p /app
COPY pyproject.toml poetry.lock /app

WORKDIR /app
RUN poetry install --without dev

COPY . /app

EXPOSE 5000
CMD ["poetry" , "run", "gunicorn", "-w", "4", "src.app:app", "-b", "0.0.0.0:5000"]
