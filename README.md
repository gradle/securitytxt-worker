# security.txt as a service -- Built on Cloudflare Workers

This is a fork of the original project by cloudflare.
The configuration in this repository has been modified for Gradle's use.

This is the worker that serves [security.txt](https://securitytxt.org) on
[gradle.com](https://gradle.com) and [gradle.org](https://gradle.org).

## Background

From https://securitytxt.org,

```
When security risks in web services are discovered by independent security researchers who
understand the severity of the risk, they often lack the channels to disclose them properly.
As a result, security issues may be left unreported. security.txt defines a standard to help
organizations define the process for security researchers to disclose security vulnerabilities
securely.
```

## Steps for deployment

Deploying should take about 5 minutes or less.

**macOS**

Please have [homebrew](https://brew.sh/) installed.

```sh
brew install gnupg
```

⚠️ Additionally, this project requires [wrangler](https://github.com/cloudflare/wrangler) to be installed for builds/deploys. In turn, this means that you'll need [Node installed](https://nodejs.org/en/download/package-manager/).

### Publishing on your zone

#### 1. Setup wrangler

You will need to configure wrangler.toml:

```sh
mv wrangler.toml.template wrangler.toml
```

and fill in the following values (account_id and zone_id are found on your Cloudflare zone dashboard):

- account_id
- zone_id
- routes

You will need to obtain a *scoped API* token to publish the worker.  
You can do this at (https://dash.cloudflare.com/profile/api-tokens),
and choose the "Edit Cloudflare Workers" template.
We will later call the obtained token: `${TOKEN}`.

#### 2. Testing Changes

You can test your changes locally by running either:
```bash
make dev-com
make dev-org 
```

#### 3. Deploy

You must deploy to each zone independently.

a. Run: `CF_API_TOKEN=${token} make deploy-com`
b. Run: `CF_API_TOKEN=${token} make deploy-org`
