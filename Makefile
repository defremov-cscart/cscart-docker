CS_WWW=/var/www/html
CS_START_PROD=docker-compose -f docker-compose-certbot.yaml --project-name cscart
#CS_START_DEV=docker-compose -f docker-compose_dev.yaml --project-name cscart-dev
#
#include .env
#export
#
run_prod:
	@./init-letsencrypt.sh
#run_dev:
#	@$(CS_START_DEV) up -d


#c_imp_prod:
#IMPORTING DATABASES
#	@docker exec -i $$($(CS_START_PROD) ps -q mysql) mysql -u$(CS_MYSQL_USER) -p$(CS_MYSQL_PASS) $(CS_MYSQL_DB) < ${CS_DUMP}
#c_drop_db:
#	@docker exec -i $$($(CS_START_PROD) ps -q mysql) mysql -u$(CS_MYSQL_USER) -p$(CS_MYSQL_PASS) -e"DROP DATABASE $(CS_MYSQL_DB)"
#	@docker exec -i $$($(CS_START_PROD) ps -q mysql) mysql -u$(CS_MYSQL_USER) -p$(CS_MYSQL_PASS) -e"CREATE DATABASE $(CS_MYSQL_DB)"
#	@docker exec -i $$($(CS_START_PROD) ps -q mysql) mysql -u$(CS_MYSQL_USER) -p$(CS_MYSQL_PASS) $(CS_MYSQL_DB) -e"UPDATE cscart_companies SET storefront = '$(STOREFRONT_ADDRESS)', secure_storefront = '$(STOREFRONT_ADDRESS)'"

fix_perm_prod:
	@docker exec -i $$($(CS_START_PROD) ps -q php) sh -c "chmod 666 $(CS_WWW)/config.local.php"
	@docker exec -i $$($(CS_START_PROD) ps -q php) sh -c "chmod -R 777 $(CS_WWW)/design && find "$(CS_WWW)/design" -type f -print0 | xargs -0 chmod 666"
	@docker exec -i $$($(CS_START_PROD) ps -q php) sh -c "chmod -R 777 $(CS_WWW)/images && find "$(CS_WWW)/images" -type f -print0 | xargs -0 chmod 666"
	@docker exec -i $$($(CS_START_PROD) ps -q php) sh -c "chmod -R 777 $(CS_WWW)/var && find "$(CS_WWW)/var" -type f -print0 | xargs -0 chmod 666"

fix_perm_dev:
	@docker exec -i $$($(CS_START_DEV) ps -q php) sh -c "chmod 666 $(CS_WWW)/config.local.php"
	@docker exec -i $$($(CS_START_DEV) ps -q php) sh -c "chmod -R 777 $(CS_WWW)/design && find "$(CS_WWW)/design" -type f -print0 | xargs -0 chmod 666"
	@docker exec -i $$($(CS_START_DEV) ps -q php) sh -c "chmod -R 777 $(CS_WWW)/images && find "$(CS_WWW)/images" -type f -print0 | xargs -0 chmod 666"
	@docker exec -i $$($(CS_START_DEV) ps -q php) sh -c "chmod -R 777 $(CS_WWW)/var && find "$(CS_WWW)/var" -type f -print0 | xargs -0 chmod 666"

clean_cache__prod:
	@docker exec -i $$($(CS_START_PROD) ps -q php) sh -c "rm -fr $(CS_WWW)/var/cache/*"
clean_cache__dev:
	@docker exec -i $$($(CS_START_DEV) ps -q php) sh -c "rm -fr $(CS_WWW)/var/cache/*"
