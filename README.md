# a1111-dynamic
a1111 with a custom entrypoint script that loads models based on environment variables

You can use the prebuilt docker image at:
```
saladtechnologies/a1111:dynamic
```

## Build your own image

### Without a model preloaded

The "baked" images use this one as a base

```shell
## Usage: ./build [--push]
./scripts/build
```

### With a model preloaded

```
Usage: ./build-baked [OPTIONS]

Options:
  --push                          Push the built image to DockerHub. Default: false
  --civitai-version-ids <v1,v2>   Comma-separated list of CivitAI model version IDs to load. Default: ""
  --load-refiner                  Load the refiner model. Default: false
  --load-sdxl-base                Load the SDXL base model. Default: false
  --controlnet-urls <url1,url2>   Comma-separated list of ControlNet download URLs. Default: ""
  --extension-urls <url1,url2>    Comma-separated list of extension Git URLs. Default: ""
  --ckpt-urls <url1,url2>         Comma-separated list of CKPT download URLs. Default: ""
  --vae-urls <url1,url2>          Comma-separated list of VAE download URLs. Default: ""
  --lora-urls <url1,url2>         Comma-separated list of LoRa download URLs. Default: ""
  --tag <tag>                     Tag to use for the image. Defaults to the CivitAI version IDs with a hyphen between them
  --image <image>                 Image to build. Default: saladtechnologies/a1111
  --help                          Show this message and exit
```

**Examples**

Load 2 models from civitai
```shell
./scripts/build-baked --civitai-version-ids 122143,128713
```

Load SDXL Base and Refiner, and push the image to your own repository with a custom tag
```shell
./scripts/build-baked --load-sdxl-base --load-refiner --push --tag sdxl1.0 --image my-org/my-repo
```


## Environment Variables
| Variable                  | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | Default |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------- |
| PORT                      | The port to listen on. This should match the port you configure for Salad networking.                                                                                                                                                                                                                                                                                                                                                                                                            | 7860    |
| CIVITAI_MODEL_VERSION_IDS | A comma-separated list of model version IDs to download. ex `128713` for just [Dreamshaper 8](https://civitai.com/models/4384?modelVersionId=128713) or `128713,166808` for Dreamshaper and [Arterior](https://civitai.com/models/112229/arterior-digital-art-style). This supports Checkpoints, VAEs, Controlnets, and LoRAs. The rightmost checkpoint value will be the default checkpoint when the server starts, and the rightmost vae value will be the default vae when the server starts. | None    |
| LOAD_SDXL_BASE            | If set to `1`, the SDXL base model will be downloaded.                                                                                                                                                                                                                                                                                                                                                                                                                                           | 0       |
| LOAD_REFINER              | If set to `1`, the SDXL refiner model will be downloaded.                                                                                                                                                                                                                                                                                                                                                                                                                                        | 0       |
| CONTROLNET_URLS           | A comma-separated list of download urls for controlnets. ex `https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/diffusers_xl_canny_mid.safetensors?download=true`                                                                                                                                                                                                                                                                                                              | None    |
| CLI_ARGS                  | Additional arguments to pass to the `sdnext` launch command. Options can be found with `--help`                                                                                                                                                                                                                                                                                                                                                                                                  | None    |
| EXTENSION_URLS            | A comma separated list of extension git urls to load e.g. `https://github.com/deforum-art/sd-webui-deforum`                                                                                                                                                                                                                                                                                                                                                                                      | None    |
| CKPT_URLS                 | A comma separated list of checkpoint download urls to load. e.g. `https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors?download=true`                                                                                                                                                                                                                                                                                                         | None    |
| VAE_URLS                  | A comma separated list of vae download urls to load. e.g. `https://huggingface.co/madebyollin/sdxl-vae-fp16-fix/resolve/main/diffusion_pytorch_model.safetensors?download=true`                                                                                                                                                                                                                                                                                                                  | None    |
| LORA_URLS                 | A comma separated list of lora download urls to load. e.g. `https://huggingface.co/ostris/ikea-instructions-lora-sdxl/resolve/main/ikea_instructions_xl_v1_5.safetensors?download=true`                                                                                                                                                                                                                                                                                                          | None    |