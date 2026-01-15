import json
import os
from datetime import datetime

class MemoryManager:
    def __init__(self, base_path="/home/ubuntu/VISION_2026/MEMORY"):
        self.base_path = base_path
        self.episodic_path = os.path.join(base_path, "episodic/session_logs.jsonl")
        self.semantic_path = os.path.join(base_path, "semantic/core_knowledge.json")
        self.working_path = os.path.join(base_path, "working/current_context.json")

    def add_episodic(self, event, details):
        entry = {
            "timestamp": datetime.now().isoformat(),
            "event": event,
            "details": details
        }
        with open(self.episodic_path, "a") as f:
            f.write(json.dumps(entry) + "\n")

    def update_working_context(self, context_data):
        with open(self.working_path, "w") as f:
            json.dump(context_data, f, indent=2)

    def get_semantic_knowledge(self):
        if os.path.exists(self.semantic_path):
            with open(self.semantic_path, "r") as f:
                return json.load(f)
        return {}

if __name__ == "__main__":
    manager = MemoryManager()
    manager.add_episodic("Memory Manager Initialized", "Python script for memory management created and tested.")
    print("Sistema de memoria actualizado.")
