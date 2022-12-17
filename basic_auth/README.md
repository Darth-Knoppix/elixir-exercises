# BasicAuth

Basic HTTP Auth in Bandit using Plug.BasicAuth

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
