FROM python:3.11

# ������� ���������� � ���������� ��� ����������
WORKDIR /app

# �������� ���� ������������ � ������������� ��
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# �������� ��� ����� �� ������� ���������� � ���������� /app � ����������
COPY . .

# ��������� ������� ��� ������� ����������
CMD ["gunicorn", "main:app", "-w", "4", "-k", "uvicorn.workers.UvicornWorker", "-b", "0.0.0.0:8000"]
