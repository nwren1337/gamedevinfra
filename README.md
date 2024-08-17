# Game Dev Infra

Because installing this stuff on VM's low key kinda sucks. 

# What is deployed right now?

- **p4d** - Custom perforce image defined locally
- **jenkins** - build automation
- **unreal engine 5.4** - containerized unreal engine for automated testing offered from unreal

# Setup

**Prerequisites :**

1. Connect your github account to [Epic Games](https://www.unrealengine.com/en-US/ue-on-github)
2. Set up a [Personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) with at least read:repository access to pull images.

**Local Setup :**

1. Clone the repo :

```
git clone git@github.com:nwren1337/gamedevinfra.git
```

2. Copy the dot envs and replace the placeholders :

```
cd gamedevinfra
cp .env.dist .env
cp p4d.env.dist p4d.env
cp jenkins.env.dist jenkins.env
```

3. Run Setup :

```
make setup
```

4. Start the containers :

```
Docker compse up
```
