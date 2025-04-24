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


from rich.console import Console
from datetime import datetime
import time

VERSION = "0.0.1"

# init the console
console = Console()

def main():
    """
    primary application entry point
    loads scenes and handles user inputs
    """

    # welcome scene
    welcome_scene()

    # load configuration
    config_loader_scene()

    # setup scene
    #setup_scene()

    # user profile scene
    #user_profile_scene()

    # main loop (for demonstration purposes)
    while True:
        console.print("Main Loop: Press [bold red]Ctrl+C[/bold red] to exit.")
        console.input()  # Wait for user input to continue


###############################
#   welcome scene             #
###############################
def welcome_scene():
    # clear the console screen for the user
    console.clear()

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

    # prompt user and go to next scene
    console.print("[bold blue]Enter[/bold blue] to continue or [bold red]Ctrl+C[/bold red] to exit.")
    console.input()  # Wait for user input to continue

###############################
#   configloader scene        #
###############################
def config_loader_scene():
    # clear the console screen for the user
    console.clear()

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
#   setup scene               #
###############################

###############################
#   user profile scene        #
###############################

if __name__ == "__main__":
    main()
