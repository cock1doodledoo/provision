git recipe
===
- install git package
- set user.name and user.email on git

## description
[itamae](https://github.com/itamae-kitchen/itamae "itamae") recipe to install git package.
and to set the user.name and user.email on git from the attribures **git_user** and **git_email**.
ubuntu14.04 is expected.

## attributes
for example
``` yaml
git_user: git            # user.name on `git config --global`
git_email: git@localhost # user.email on `git config --global`
```

## depend on
- nothing
