# CookieAuth with signing and encryption

Experiment with authentication using cookies. Sets encrypted and signed cookies on login and uses retrieves the signed value on the restricted page.

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
