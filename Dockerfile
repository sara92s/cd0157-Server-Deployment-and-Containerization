FROM python:stretch

COPY . /cd0157-Server-Deployment-and-Containerization
WORKDIR /cd0157-Server-Deployment-and-Containerization

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ENV FLASK_DEBUG=1
ENV FLASK_APP=main.py

COPY requirements.txt requirements.txt
ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]