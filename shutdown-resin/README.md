# Auto Shutdown Cronjob

## Cronjob

To debug, pipe the command's output to
`/proc/1/fd/1`

so that it appears in the system's logs.

You might otherwise have better luck these days with `systemd` timers:

https://wiki.archlinux.org/index.php/Systemd/Timers

The example repo I linked above shows how to pipe to `/proc/1/fd/1`:

https://github.com/resin-io-playground/cron-update-locks/blob/master/jobs.txt

For generate cronjob: [Cronjob Editor](https://crontab.guru/)

## Install via Resin

## Install Manually

Run commands:

```bash
cd shutdown-resin
sh install.sh
```
