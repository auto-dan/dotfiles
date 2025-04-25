## wow addon sync console appliction
## primarily for syncing addons between multiple computers and steamdeck
## targeting linux support initially, will expand to windows and mac later

# on init, load configuration file(s)
# this config sets paths for installation files, downloads, etc
# this config file contains manifest with currently installed versions
# this config contains urls for mirrors?

# if no config is found, assume first time setup


# application broken down into 'scenes'
# welcome, setup, update, search, install, history, etc
# these scenes are pages that draw in the terminal and allow for user keyboard input
# users navigate through the scenes via keyboard input or logical application paths

from rich.console import Console, Group
from rich.panel import Panel
from rich.layout import Layout
from rich.live import Live
from rich.text import Text
from datetime import datetime
import time
import threading
import keyboard


# init console obj
console = Console()

# available scenes
SCENES = {
        "welcome": "welcome_scene",
        "setup": "setup_scene",
        "config_loader": "config_loader_scene",
}

# active scene
current_scene = "welcome"

VERSION = "0.0.1"


def main():
    """
    primary application entry point
    loads scenes and handles user inputs
    """
    # start thread to listen for keypresses
    threading.Thread(target=listen_for_keypress, daemon=True).start()

    # welcome scene always transitions into config loader
    with Live(make_layout(), refresh_per_second=10, screen=True) as live:
        while True:
            live.update(make_layout())
            if current_scene == "quit":
                break
            time.sleep(1) # prevent high CPU usage

    # what about a navigator?

    # load configuration
    #config_loader_scene()

    # setup scene
    #setup_scene()

    # user profile scene
    #user_profile_scene()

    # main loop (for demonstration purposes)
#     while True:
#         console.print("Main Loop: Press [bold red]Ctrl+C[/bold red] to exit.")
#         console.input()  # Wait for user input to continue

def rendor_scene(scene_name: str) -> Panel:
    content = SCENES.get(scene_name, "Scene not found")
    return Panel(content, title=f"{scene_name.capitalize()} Scene", border_style="blue")

def make_layout() -> Layout:
    layout = Layout()
    layout.split(
        Layout(rendor_scene(current_scene), name="scene", ratio=3),
        Layout(rendor_navigator(), name="navigator", size=3)
    )
    return layout

def listen_for_keypress():
    """
    listen for keypresses and update the current scene
    """
    global current_scene
    while True:
        if keyboard.is_pressed("w"):
            current_scene = "welcome"
        elif keyboard.is_pressed("s"):
            current_scene = "setup"
        elif keyboard.is_pressed("c"):
            current_scene = "config_loader"
        elif keyboard.is_pressed("u"):
            current_scene = "user_profile"
        elif keyboard.is_pressed("q"):
            console.print("Exiting...")
            break
        time.sleep(1)  # Prevent high CPU usage

###############################
#   welcome scene             #
###############################
def rendor_welcome():
    # title
    console.print("\n")
    console.print("-welcome scene-", style="bold cyan")
    console.print("\n")

    # print the welcome message
    console.print("welcome to wsync", style="bold blue")
    console.print("no bs addon management", style="italic blue")

    # print the current version, datetime
    now = datetime.now()
    current_time = now.strftime("%Y-%m-%d %H:%M:%S")
    console.print() # formatting
    console.print(f"version: {VERSION}", style="bold blue")
    console.print(f"dttm: {current_time}", style="bold yellow")

###############################
#   navigator                 #
###############################
def rendor_navigator():
    """
    this scene is a nav manu available on all scenes (except welcome)
    allowing the user to transition between chosen scenes
    """
    nav_text = Text(" [W]elcome | [S]etup | [C]onfig | [U]ser Profile | [Q]uit ", style="bold white on dark_green")
    return Panel(nav_text, title="Navigator", border_style="green")


###############################
#   config loader             #
###############################
def config_loader_scene():
    # title
    console.print("\n")
    console.print("-config scene-", style="bold cyan")
    console.print("\n")

    # load and animate loading
    console.print("Loading configuration...", style="bold yellow")
    console.print("This will only take a few seconds...", style="bold yellow")
    console.print()
    for _ in range(66):
        console.print(".", end="", style="bold yellow")
        time.sleep(.006)  # Simulate loading time
    console.print(" Done!", style="bold green")
    console.print()
    console.print("Configuration loaded.", style="bold blue")

###############################
#   config writer             #
###############################

###############################
#   user profile              #
###############################

if __name__ == "__main__":
    main()
