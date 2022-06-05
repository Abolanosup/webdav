FROM python:3.10-alpine

WORKDIR /app
COPY . /app

RUN apk add gcc py3-cffi libffi-dev musl-dev openssl openssl-dev && \
    pip install -r requirements.txt && \
    apk del gcc libffi-dev musl-dev openssl-dev

ENV TELEGRAM_BOT_TOKEN "5515358050:AAFgVoOE2BbyyfS0pGg2AohG0mSBiCTo3XM"
ENV TELEGRAM_BOT_CHAT_IDS "1161231954"
ENV TELEGRAM_FILE_NAMING_CONVENTION "date+type"
ENV TELEGRAM_FILE_NAMING_INCLUDE_EXTENSION "1"
ENV WEBDAV_USERNAME "diana.eng"
ENV WEBDAV_PASSWORD "Didi*002"
ENV WEBDAV_PATH_URL "https://nube.uo.edu.cu/remote.php/dav/files/C475E9BA-AC40-4E7E-B3BF-4FD3266B0075/"
ENV ENABLE_DEBUG "0"

ENTRYPOINT ["python", "-m", "telegram_webdav_integration_bot"]
