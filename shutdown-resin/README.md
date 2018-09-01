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


### Cronjob for shutdown

```bash
sudo crontab -e

# In crontab add this line
@reboot /sbin/shutdown -h 19:30
# ctrl+X to save and install the crontab.
```

### Check cronjob working

```bash
/var/log/syslog

# Logs probably go to syslog, which varies depending on what syslog daemon is involved and how that is configured to log, start with
grep -r cron /etc/*syslog*

#to find where and what is going on on the system, or per derobert under systemd the relevant command is

journalctl -b 0 _SYSTEMD_UNIT=cron.service
```

## Install via Resin

## Install Manually

Run commands:

```bash
cd shutdown-resin
sh install.sh
```
