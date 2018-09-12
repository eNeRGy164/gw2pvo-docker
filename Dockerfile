FROM alpine:3.8

RUN apk add --no-cache python3 tzdata && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache && \
    pip install https://github.com/markruys/gw2pvo/releases/download/v1.1.0/gw2pvo-1.1.0.tar.gz

ENV GW_STATION_ID="" \
    GW_REGION="global" \
    PVO_SYSTEM_ID="" \
    PVO_API_KEY="" \
    PVO_INTERVAL="15" \
    LOG="info" \
    CITY="Amsterdam" \
    TZ="Europe/Amsterdam"

ENTRYPOINT exec gw2pvo \
    --gw-station-id ${GW_STATION_ID} \
    --gw-region ${GW_REGION} \
    --pvo-system-id ${PVO_SYSTEM_ID} \
    --pvo-api-key ${PVO_API_KEY} \
    --pvo-interval ${PVO_INTERVAL} \
    --log ${LOG} \
    --city ${CITY} \
    --skip-offline