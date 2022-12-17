# Cookie Session

Experiment with storing values in cookies via Plug.Session

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
