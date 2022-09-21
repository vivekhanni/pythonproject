FROM python:3.8.0
WORKDIR /app
COPY ./app.py /app
COPY ./requirements.txt /app
RUN pip install -r requirements.txt
CMD gunicorn --bind:0.0.0.0:5000 app:app
