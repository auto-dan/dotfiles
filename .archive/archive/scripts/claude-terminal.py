import os
import sys
import json
import argparse
import requests
from typing import List, Dict, Any, Optional

class ClaudeTerminal:
    """
    a simple and basic terminal client for api requests to Claude AI
    """
    TARGET_MODEL = "claude-3-7-sonnet-20250219"
    ANTHROPIC_VERSION = "2023-06-01"

    def __init__(self, api_key: str, model: str = TARGET_MODEL):
        self.api_key = api_key
        self.model = model
        self.api_url = "https://api.anthropic.com/v1/messages"
        self.headers = {
                "x-api-key": self.api_key,
                "anthropic-version": self.ANTHROPIC_VERSION,
                "Content-Type": "application/json"
                }
        self.conversation_history = []

    def send_message(self, message: str, max_tokens: int = 4096) -> str:
        """
        send a message to the target model and return the response
        """
        payload = {
                "model": self.model,
                "max_tokens": max_tokens,
                "messages": self.build_messages(message),
            }

        try:
            response = requests.post(
                    self.api_url,
                    headers=self.headers,
                    json=payload
                )
            response.raise_for_status()
            result = response.json()

            # extract text content
            content = result["content"][0]["text"]

            # update convo history
            self.conversation_history.append({"role": "user", "content": message})
            self.conversation_history.append({"role": "assistant", "content": content})

            return content
        except requests.exceptions.RequestException as e:
            if hasattr(e, "response") and e.response is not None:
                error_message = f"API error: {e.response.status_code} - {e.response.text}"
            else:
                error_message = f"request error: {str(e)}"
            return error_message

    def build_messages(self, new_message: str) -> List[Dict[str, str]]:
        """
        build message array for api request(s)
        """
        if not self.conversation_history:
            return [{"role": "user", "content": new_message}]
        else:
            return self.conversation_history + [{"role": "user", "content": new_message}]

    def save_conversation(self, filepath: str) -> None:
        """
        save conversation history to a file
        """
        with open(filepath, "w") as file:
            json.dump(self.conversation_history, file)

    def load_conversation(self, filepath: str) -> None:
        """
        load convo from a file
        """
        with open(filepath, "r") as file:
            self.conversation_history = json.load(file)
