# support-tools
Tools to help with the support of Threat Stack

USAGE:
Option 1: Check out this branch on GitHub, and run 'diagnostics.sh'
Option 2: Download diagnostics.sh manually, along with the contents of each of the folders. IMPORTANT: When you download these files, make sure that the directory structure remains the same as in GitHub.

'diagnostics.sh' is a master script which, when run, gathers information about the system it is run on. It calls the following child scripts:
	'gather_system_info.sh' runs a series of commands which return some basic information about the host system, such as OS version, kernel version, and system uptime
	'gather_docker_info.sh' runs a series of commands which first check whether docker is installed, and then returns some information about Docker if it's located

For each of these scripts, diagnostics.sh tees the output to a file in /opt/threatstack/cloudsight/logs. Then, it calls 'tar_logs.sh', which tars that directory together (excluding tsaudit logs). The resulting file is saved in your current working directory. From there, please send that file to Threat Stack. If you wish, you may encrypt the files with support.pub, which is included in the repository as well.
