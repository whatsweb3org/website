import os

path = "../docs/solidity-basic/"

for filename in os.listdir(path):
    if filename.endswith(".md"):
        with open(os.path.join(path, filename), "r") as file:
            contents = file.read()
            start = contents.find("```solidity")
            while start != -1:
                end = contents.find("```", start + 1)
                code = contents[start + 12:end].strip()
                previous_line = contents[:start].strip().split("\n")[-1]
                if previous_line.startswith(":::tip"):
                    tip_title = previous_line.split(" ")[1].strip()
                    name = tip_title
                else:
                    name = f"{filename[:-3]}_{start}"
                code_path = f"sample-code/{filename[:-3]}/"
                if not os.path.exists(code_path):
                    os.makedirs(code_path)
                with open(f"{code_path}/{name}.sol", "w") as code_file:
                    code_file.write(
                        "// SPDX-License-Identifier: GPL-3.0\n\n"
                        "pragma solidity ^0.8.17;\n\n"
                        "contract ExampleContract {\n    "
                        + code.replace("\n", "\n    ")
                        + "\n}"
                    )
                start = contents.find("```solidity", end + 1)
