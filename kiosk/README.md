# Setup Chromium Kiosk - Raspberry Pi

---

We have enforced desktop auto login and written our kiosk script, we need to go ahead and modify the lxsession autostart script by running the following command on the Raspberry Pi.

`nano /home/pi/.config/lxsession/LXDE-pi/autostart`

As we don’t want any screensavers to run, we definitely don’t want the xscreensaver application to be getting launched on our Raspberry Pi Kiosk.

So, the first thing we need to do in this file is to comment out a particular line that launches up the xscreensaver application.

Find

`@xscreensaver -no-splash`

Replace with

`#@xscreensaver -no-splash`

```bash
@lxpanel --profile LXDE-pi
@pcmanfm --desktop --profile LXDE-pi
#@xscreensaver -no-splash
@point-rpi
@bash /home/pi/kiosk.sh
```