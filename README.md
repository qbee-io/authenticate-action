# authenticate-action
Authentication method for accessing the qbee.io API within GitHub runners.

# Usage
Include the following snipped in your `yaml` file to access the qbee.io API with the obtained authorization token. See [qbee-io/file-upload-action](https://github.com/qbee-io/file-upload-action) for an example on how to use this authentication action.

```yaml
name: qbee.io authentication
uses: qbee-io/authenticate-action@v1
id: qbee-auth
with:
    login: ${{ secrets.USERNAME_KEY }}
    password: ${{ secrets.PASSWORD_KEY }}
```

# Input variables
* `login`: the username you use to log into the qbee.io platform
* `password`: the corresponding password

This information is sensitive and we recommend to store it in [GitHub secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets) such that it is encrypted.

# Output variables
* `token`: the authentication token needed for other API calls

to access the output you need to give the authentication step an `id`. Above we used

``` yaml
id: qbee-auth
```
Such that we get the token with the following command

```
${{ steps.qbee-auth.outputs.token }}
```
See [qbee-io/file-upload-action](https://github.com/qbee-io/file-upload-action) for an example.