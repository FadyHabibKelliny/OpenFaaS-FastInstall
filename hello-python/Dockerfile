FROM python:3.9-slim-buster

WORKDIR /home/app/

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY handler.py .
COPY index.py .

EXPOSE 8080

CMD ["python", "index.py"]