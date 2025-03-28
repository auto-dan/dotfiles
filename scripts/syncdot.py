import os
import sys
import logging
import json
from shutil import copyfile
import datetime

DOWNLOAD_DIR = os.path.expanduser("~/Downloads/dotfiles")
CONFIG_DIR = os.path.expanduser("~/.config")

GIT_ADDRESS = "https://github.com/auto-dan/dotfiles.git"

LOGGING_LEVEL = logging.INFO
LOG_PATH = os.path.join("syncdot.log")
LOGGER = logging.getLogger('syncdot')

logging.basicConfig(
        level=LOGGING_LEVEL, 
        format="%(asctime)s - %(name)s - %(levelname)s - %(message)s", 
        filename=os.path.join(LOG_PATH),
        filemode="w"
        )

# main function
# need great logging along the way
def syncdot():
    # setup logging
    LOGGER.info("syncdot initiated")

    # identify machine in use
    machine_name = os.uname().nodename

    # create directories if not present
    if not os.path.exists(DOWNLOAD_DIR):
        os.makedirs(DOWNLOAD_DIR)
     
    # download latest dotfiles from github into source directory
    LOGGER.info("downloading latest dotfiles from github")
    os.system(f"git clone {GIT_ADDRESS} {DOWNLOAD_DIR}")

    # copy dotfiles to appropriate locations
    LOGGER.info("copying dotfiles to appropriate locations")
    os.system(f"cp -r {DOWNLOAD_DIR}/* {CONFIG_DIR}/")
    
    # clean up
    LOGGER.info("cleaning up")
    os.system(f"rm -rf {DOWNLOAD_DIR}")

    # log
    LOGGER.info({"last_sync": f"{datetime.datetime.now()}"})

# entry
if __name__ == "__main__":
    syncdot()
