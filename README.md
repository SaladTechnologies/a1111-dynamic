# a1111-dynamic
a1111 with a custom entrypoint script that loads models based on environment variables

You can use the prebuilt docker image at:
```
saladtechnologies/a1111:dynamic
```

## Environment Variables
| Variable | Description | Default |
| -------- | ----------- | ------- |
| HOST | The host to listen on. Use `[::]` on Salad. | `0.0.0.0` |
| PORT | The port to listen on. This should match the port you configure for Salad networking. | 7860 |
| CIVITAI_MODEL_VERSION_IDS | A comma-separated list of model version IDs to download. ex `128713` for just [Dreamshaper 8](https://civitai.com/models/4384?modelVersionId=128713) or `128713,166808` for Dreamshaper and [Arterior](https://civitai.com/models/112229/arterior-digital-art-style). This supports Checkpoints, VAEs, and Controlnets. The rightmost checkpoint value will be the default checkpoint when the server starts, and the rightmost vae value will be the default vae when the server starts. | None |
| LOAD_REFINER | If set to `1`, the SDXL refiner model will be downloaded. | 0 |
| CLI_ARGS | Additional arguments to pass to the `sdnext` launch command. Options can be found with `--help` | None |
| EXTENSIONS | A comma separated list of extensions to load, each in the format of `name\|repoUrl`. e.g. `deforum\|https://github.com/deforum-art/sd-webui-deforum`  | None |