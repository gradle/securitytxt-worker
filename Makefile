# Copyright (c) 2020, Cloudflare, Inc. All rights reserved.
# author: David Haynes <dhaynes@cloudflare.com>

# Dependecies
clean:
	rm -rf ./worker/ ./dist/

# Interfaces
dev-com: clean
	wrangler dev --env gradle-com

dev-org: clean
	wrangler dev --env gradle-org

deploy-com: clean
	wrangler publish --env gradle-com

deploy-org: clean
	wrangler publish --env gradle-org


.PHONY: clean deploy-com deploy-dev dev-com dev-org
