FROM python:3.9-slim
LABEL maintainer="hoffeldervinicius@gmail.com"
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
ENV REDIS_HOST=redis
CMD ["python", "app.py"]


