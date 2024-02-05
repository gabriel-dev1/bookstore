FROM python:3.11.4-slim

ENV PYTHONUNBUFFERED=1 \ 
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \ 
    PIP_DEFAULT_TIMEOUT=100

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    libpq-dev \
    gcc \
    libc-dev \
    && rm -rf \var\lib\apt\lists\* 

RUN apt-get update \ 
    && apt-get -y install libpq-dev gcc \
    && pip install psycopg2 

WORKDIR /app

COPY requirements.txt .
RUN pip install --upgrade pip \
    && pip install --no-binary=backports.zoneinfo -r requirements.txt 

COPY . . 
EXPOSE 8000 
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
