import os
import sys
import logging
import json
from shutil import copyfile
import datetime

CONFIG_DIR = os.path.expanduser("~/.config")
SYNCDOT_CONFIG_DIR = os.path.join(CONFIG_DIR, "syncdot")
DOTFILES_DIR = os.path.expanduser("~/Documents/github/dotfiles")
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

    # identify or setup manifest and history
    manifest_path = os.path.join(SYNCDOT_CONFIG_DIR, "manifest.json")
    manifest_dict = {}

    # if syncdot config directory doesn't exist, create it
    if not os.path.exists(SYNCDOT_CONFIG_DIR):
        LOGGER.info("syncdot config directory does not exist, creating it")
        os.makedirs(SYNCDOT_CONFIG_DIR)

    # if manifest file doesn't exist, create it
    if not os.path.exists(manifest_path):
        LOGGER.info("manifest does not exist, creating it")
        with open(manifest_path, "w") as f:
            f.write("{}")

    # identify machine in use
    machine = os.uname().nodename
    manifest_dict.update({"machine": machine})

    # review manifest for last sync dttm

    # pull latest dotfiles from github into source directory

    # copy dotfiles to target directory

    # update manifest with current dttm
    manifest_dict.update({"last_sync": f"{datetime.datetime.now()}"})

    # update manifest file
    # convert to json
    with open(manifest_path, "w") as manifest_file:
        manifest_file.write(json.dumps(manifest_dict))

# entry
if __name__ == "__main__":
    syncdot()
