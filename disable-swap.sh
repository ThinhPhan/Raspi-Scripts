#!/bin/bash

# -------------------------------------------------------------------------
# Disable Swap
# -------------------------------------------------------------------------

sudo dphys-swapfile swapoff
sudo dphys-swapfile uninstall
sudo update-rc.d dphys-swapfile remove