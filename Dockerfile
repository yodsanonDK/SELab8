FROM jenkins/jenkins:lts-jdk17

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 python3-venv python3-pip \
    chromium chromium-driver \
    ca-certificates curl unzip \
    fonts-liberation \
    libnss3 libatk-bridge2.0-0 libgtk-3-0 libgbm1 \
    && rm -rf /var/lib/apt/lists/*

# สร้าง venv
RUN python3 -m venv /opt/venv \
 && /opt/venv/bin/pip install --no-cache-dir --upgrade pip \
 && /opt/venv/bin/pip install --no-cache-dir \
    robotframework \
    robotframework-seleniumlibrary \
    selenium

ENV PATH="/opt/venv/bin:$PATH"

USER jenkins
