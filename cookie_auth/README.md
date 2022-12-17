# CookieAuth

Experiment with authentication using cookies. This example doesn't use any signing or encryption, this is so we can see the whole journey without added complexity.

## Setup

Install dependencies `mix deps.get`

### Generating certificates for SSL

```sh
brew install mkcert
brew install nss # if you use Firefox

mkcert -install

mix gen.certs
```

## Running the server

`mix run --no-halt`
