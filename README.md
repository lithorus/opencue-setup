# opencue-setup

This is an attempt to make the cuebot setup a little easier and using more of the features of docker-compose.

Clone the repo in a directory of you choosing or download and extract the repo.

## Quick Guide ##

Inside the `cuebot` directory, bring up the `db` service first
```bash
docker-compose up -d db
```

While the db is getting ready run the getSource.sh script to download the source which is needed for the next step.
```bash
./getSources.sh
```

Prepare the database with the migration script
```bash
docker-compose up flyway
```

Bring up the cuebot
```bash
docker-compose up -d cuebot
```

## Additional info ##

The `docker-compose` command and `getSources.sh` script uses the `.env` file for version info and DB details
