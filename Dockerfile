ARG BASE_TAG=ipv6-latest
FROM saladtechnologies/a1111:${BASE_TAG}

RUN apt-get update && apt-get install -y \
  curl \
  jq \
  wget \
  git

COPY load_models_and_start .

ENV HOST='0.0.0.0'
ENV PORT=7860
ENV DATA_DIR='/data'

ENTRYPOINT ["./load_models_and_start"]

CMD python -u webui.py --listen --port 7859 ${CLI_ARGS} & socat TCP6-LISTEN:${PORT},fork TCP4:127.0.0.1:7859;