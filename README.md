# telegram-message-api

## Build

```sh
docker build -t telegram-message-api .
```

## Usage
Copy `.env.sample` to `.env` and fill in your Telegram chat ID and bot token.

Run container
```sh
docker run --rm --name telegram -p 8080:8080 -d --env-file .env telegram-message-api
```

Send URL encoded message
```
curl -G --data-urlencode $'message=*Pretty bold*\nDon\'t you think?' "localhost:8080/telegram"
```

