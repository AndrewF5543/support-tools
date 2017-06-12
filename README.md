Threat Stack Support Tools

You have two options for using this support tool:
# Check out this branch on Github and run `diagnostics.sh`
# Download `diagnostics.sh` manually with the contents of each of the folders

**IMPORTANT!** If you choose to download `diagnostics.sh` and the folders manually, confirm that the file directory structure remains the same as in Github.

## Master Script Overview

Running the `diagnostics.sh` master script gathers system information. It calls the following child scripts and runs a series of commands that:
- `gather_system_info.sh`: returns information about the host system (such as OS version, kernel version, and system uptime)
- `gather_agent_info.sh`: returns information about the agent installed on the host system (such as agent version, the output of `cloudsight status`, and the contents of `config.json`)
- `gather_docker_info.sh`: returns information if Docker is installed and located

The result for each of these scripts, `diagnostics.sh` outputs to a file in `/opt/threatstack/cloudsight/logs`. Then it calls `tar_logs.sh` that tars that directory together, excluding `tsaudit` logs. The resulting file saves in your current working directory in .tar.gz format, named `ts_logs_<CURRENT_DATE>.tar.gz`. An example of the name `ts_logs_05-25-2017.tar.gz`.

Send that file to Threat Stack. You can encrypt the files with `support.pub`, also located in the repository.
