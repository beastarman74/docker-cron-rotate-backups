# Docker cron rotate backups

Uses [rotate-backups](https://rotate-backups.readthedocs.io/en/latest/) with a scheduled job to maintain a list of files limited to a given time range.

## Example in a Docker composition

```yml
services:
  rotate:
    image: beastarman/docker-rotate-backups
    container_name: rotate-backups
    volumes:
      - /pathto-backups-folder1:/backups1
      - /pathto-backups-folder2:/backups2
      - /pathto-backups-folder3:/backups3
      # Add more backup folders if required, add them as volumes and also into the config.ini configuration file
      - /pathto/config.ini:/etc/rotate-backups.d/config.ini
    environment:
      # cron format 
      ROTATE_CRON: "*/10 * * * *"
      # additional options to pass to the command line such as verbose and dry-run, useful for testing.
      ROTATE_OPTIONS: "--dry-run --verbose"
      PUID: 1000
      PGID: 1000
      TZ: Europe/London   
    stdin_open: true # docker run -i
    tty: true # docker run -t      0
    networks:
      rotate-backups
     
networks:
  rotate-backups:
    driver: bridge
    name: rotate-backups
```

Uses a `config.ini` to support multiple backup folders and individual rotation configuration per folder.

Create a file with the below format. Map the file into the container to `/etc/rotate-backups.d/config.ini`.

Add as many folders as needed into the cconfig file and map the folders into the container, matching the folder path in the ini file.

```
# /etc/rotate-backups.ini:
# Configuration file for the rotate-backups program that specifies
# directories containing backups to be rotated according to specific
# rotation schemes.

[/backups1]
hourly = 24
daily = 7
weekly = 1
monthly = 1
yearly = 1
ionice = idle

[/backups2]
daily = 7
weekly = 4
monthly = 12
yearly = 0
ionice = idle

[/backups3]
daily = 7
weekly = 4
monthly = 2
yearly = 1
ionice = idle

```
Use the `--dry-run` option using the ROTATE_OPTIONS environment variable to get the rotate-backups command to show what would be removed/kept without making any actual changes.

See [rotate-backups doc](https://rotate-backups.readthedocs.io/en/latest/) for more informations.
