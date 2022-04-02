# Balena CLI

## How to deploy?

```shell
npm run deploy
```

## How to use?

```shell
export BALENA_API_TOKEN=token
docker run -e BALENA_API_TOKEN=$BALENA_API_TOKEN -v $(pwd):/app bartoszadamczyk/balena-cli push app-name
```
