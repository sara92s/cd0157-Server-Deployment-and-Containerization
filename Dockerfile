FROM python:stretch

COPY . /app
WORKDIR /app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ENV FLASK_DEBUG=1
ENV FLASK_APP=main.py

ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]