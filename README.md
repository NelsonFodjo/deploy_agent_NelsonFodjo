# deploy_agent_NelsonFodjo

## Running the script

```bash
git clone https://github.com/NelsonFodjo/deploy_agent_NelsonFodjo.git
cd deploy_agent_NelsonFodjo
chmod +x setup_project.sh
./setup_project.sh
```

It will ask you for a project name, create a main directory in the form attendance_tracker_{name}, then build everything from there. You'll also get the option to change the default attendance thresholds (75% warning, 50% failure) — just type `y` and enter your values, or `n` to leave them as they are. Before that, make sure that the files: attendance_checker.py, assets.csv, config.json, reports.log and setup_project.sh are all in the same directory.

At the end, the script checks if `python3` is installed and confirms all the files are in the right place.

---

## Project structure it creates

```
attendance_tracker_{name}/
├── attendance_checker.py
├── Helpers/
│   ├── assets.csv
│   └── config.json
└── reports/
    └── reports.log
```

---

## How to trigger the archive (Ctrl+C)

If you press `Ctrl+C` while the script is running, it won't just crash. It catches the signal, zips up whatever has been created so far into `attendance_tracker_{name}_archive.zip`, then deletes the incomplete folder so nothing is left in a broken state.

This is useful if you started the setup with the wrong name or just want to cancel cleanly.
