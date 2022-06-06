FROM python:3.7-alpine
MAINTAINER  azubyne

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1 
# Set work directory

# WORKDIR /code
# Install dependencies

RUN  mkdir /app
WORKDIR /app
# COPY ./requirements.txt  /requirements.txt
COPY Pipfile Pipfile.lock /app/
RUN pip install pipenv && pipenv install --system
# RUN pip install r /requirements.txt


# Copy project
COPY . /app/
RUN adduser -D user
USER user