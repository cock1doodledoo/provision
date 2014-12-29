git recipe for itamae
===
- install git package
- set user.name and user.email on git

## description
This recipe is to install git, by run on [itamae](https://github.com/ryotarai/itamae "itamae").
and to set the user.name and user.email on git from the attribures **git_user_name** and **git_user_email**, if necessary.

## attributes
- **git_user_name**: user.name on git
- **git_user_email**: user.email on git

for example (yaml)
``` yaml
git_user_name: yourusername
git_user_email: yourmailaddress@domain.com
```
by default
``` yaml
git_user_name: git
git_user_email: git@localhost
```

## depend on
- nothing
