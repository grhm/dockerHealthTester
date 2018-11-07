FROM nginx:stable

COPY healthcheck.sh /app/healthcheck.sh
HEALTHCHECK --interval=3s CMD /app/healthcheck.sh
