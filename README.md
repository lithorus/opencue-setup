# opencue-setup

This is an attempt to make the cuebot setup a little easier and using more of the features of docker compose.

Clone the repo in a directory of you choosing or download and extract the repo.

# CueBot #

## Quick Guide ##

Inside the `cuebot` directory, bring up the `db` service first
```bash
docker compose up -d db
```

While the db is getting ready run the getSource.sh script to download the source which is needed for the next step.
```bash
./getSources.sh
```

Prepare the database with the migration script
```bash
docker compose up flyway
```

Bring up the cuebot
```bash
docker compose up -d cuebot
```

## Additional info ##

The `docker compose` command and `getSources.sh` script uses the `.env` file for version info and DB details


# Tools #

To build the virtualenv for the OpenCue tools run the `getTools.sh` inside the tools directory. This will create the `opencue-{OPENCUE_RELEASE}` directory with the OpenCue tools. `getTools.sh` uses the .env file for `${OPENCUE_RELEASE}`.

This requires internet access (using `pip` and `curl`) and can be done on a different machine, although you might want to keep the same full path on remote and local machine.

## Tools Environment ##

To activate the virtuelenv run
```bash
source ./activate./sh
```
This needs to be done (only once per terminal session) before using any of the below tools.

## CueGUI ##

```bash
CUEBOT_HOSTS=$HOSTS cuegui
```

## CueAdmin ##

```bash
CUEBOT_HOSTS=$HOSTS cueadmin
```

## Render Node (rqd) ##

```bash
CUEBOT_HOSTS=$HOSTS rqd
```
If you are running RQD on the same host as the docker setup, it will register on the server but **might** not be able to run any jobs. This is because it will register on the cuebot as  it's hostname which usually resolves to `127.0.1.1` from `/etc/hosts`. The underlaying docker network cannot connect to the docker hosts real localhost.
