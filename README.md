# authenticate-action
Authentication method for accessing the qbee.io API within GitHub runners.

# Usage
Include the following snipped in your `yaml` file to login to the qbee API to use the qbee github actions. This step is required before using any of the qbee actions
interfacing with the qbee API.

```yaml
name: qbee.io authentication
uses: qbee-io/authenticate-action@main
id: qbee-auth
with:
    login: ${{ secrets.USERNAME_KEY }}
    password: ${{ secrets.PASSWORD_KEY }}
```

# Input variables
* `login`: the username you use to log into the qbee.io platform
* `password`: the corresponding password

This information is sensitive and we recommend to store it in [GitHub secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets) such that it is encrypted.