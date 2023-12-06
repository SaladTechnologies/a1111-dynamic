ARG BASE_TAG=ipv6-latest
FROM saladtechnologies/a1111:${BASE_TAG}

RUN apt-get update && apt-get install -y \
  curl \
  jq \
  wget \
  git

RUN wget https://raw.githubusercontent.com/SaladTechnologies/stable-diffusion-configurator/main/configure && \
  chmod +x configure

COPY load_models_and_start .

ENV HOST='0.0.0.0'
ENV PORT=7860
ENV DATA_DIR='/data'

RUN git clone https://github.com/Mikubill/sd-webui-controlnet $DATA_DIR/config/auto/extensions/sd-webui-controlnet

ENTRYPOINT ["./load_models_and_start"]

CMD python -u webui.py --listen --port 7859 --allow-code --xformers --enable-insecure-extension-access --api ${CLI_ARGS} & socat TCP6-LISTEN:${PORT},fork TCP4:127.0.0.1:7859;