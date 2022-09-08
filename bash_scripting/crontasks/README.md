### CRON EXPRESSION:

```bash
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of week (0 - 6) (Sunday to Saturday;
# │ │ │ │ │                                       7 is also Sunday on some systems)
# │ │ │ │ │
# │ │ │ │ │
# * * * * *  command_to_execute
```

-   [Crontab Guru](https://crontab.guru/)

### SAMPLE CRONTASK:

-   `0 5 \* _ 5 rm -rf /tmp/_`

    -   Empty temp folder every Friday at 5pm

-   `0 0 \* \* \* rsync -a ~/Pictures/ ~/Google\ Drive/Pictures/`
    -   Backup images to Google Drive every night at midnight

### CRONTAB RELATED BASH COMMANDS:

-   `$ crontab -l`

    -   list out your crontab.

-   `$ crontab -e`

    -   edit your crontab.

-   `$ crontab -u user2 -e`

    -   edit user2's crontab.

-   `$ sudo crontab -u Farzana -e`

    -   Edit the cronjob for user Farzana

-   `$ sudo crontab -l`

    -   List out root user's crontab.

-   `$ crontab -r`
    -   Remove all the cronjob
