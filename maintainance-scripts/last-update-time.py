import os
import re
import subprocess
from datetime import datetime

folder = "../docs/solidity-basic/"

for filename in os.listdir(folder):
    if filename.endswith(".md"):
        file_path = os.path.join(folder, filename)
        with open(file_path, "r") as file:
            content = file.read()

            # Get the last update date
            match = re.search(r"last_update:\s*\n*date: (.*)\n", content)
            # last_update_date = match.group(1)
            if match:
                last_update_date = match.group(1)
                # Get the last modify time of the file
                result = subprocess.run(
                    ["git", "log", "-1", "--pretty=%cd", "--date=short", file_path],
                    stdout=subprocess.PIPE,
                    encoding="utf-8",
                )
                last_modify_time = result.stdout.strip()
                last_modify_time = datetime.strptime(last_modify_time, "%Y-%m-%d").strftime("%Y-%m-%d")

                # Update the last update date
                if last_update_date != last_modify_time:
                    content = re.sub(
                        r"last_update:\s*\n*date: (.*)\n", f"last_update:\n\n    date: {last_modify_time}\n", content
                    )
                    with open(file_path, "w") as file:
                        file.write(content)
            else:
                # Handle the case where the meta data was not found
                print(f"Meta data not found in file: {file_path}")

            
