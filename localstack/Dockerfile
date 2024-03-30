FROM localstack/localstack:0.13-arm64

COPY ./terraform-manifests /terraform-manifests
RUN chmod 777 /terraform-manifests

COPY ./scripts /scripts

RUN chmod 777 /scripts

RUN sh /scripts/env.sh
RUN sh /scripts/gettf.sh

