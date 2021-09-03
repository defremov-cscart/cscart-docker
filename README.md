# Readme Docker Infra Production

1. Copy repo https://github.com/defremov-cscart/cscart-docker.git
```
git clone cscart-docker && cd cscart-docker && cp env.example .env
```
2. Edit your .env. Add values for CSCART_ADDRESS, CSCART_MYSQL_RPASS, CSCART_MYSQL_PASS and CERTBOT_EMAIL
3. Run Makefile
```
make run_prod
```
