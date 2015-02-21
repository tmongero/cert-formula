# cert

Formula to deploy certificates.

See the full [Salt Formulas installation and usage instructions](http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html).

## Available states

* cert

## Example

Put certificates and keys to _/srv/salt/files/cert/_ or any other cert directory under file_roots and list them in pillar. See _cert/pillar.example_.

## Notes

At the moment all certs will be named to _certname.pem_ and their key files to _certname.key.pem_.
