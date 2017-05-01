# support-tools
Tools to help with the support of Threat Stack

'diagnostics.sh' is a master script which, when run, gathers information about the system it is run on. It calls the following child scripts:
	'gather_system_info.sh' runs a series of commands which return some basic information about the host system, such as OS version, kernel version, and system uptime
	'gather_docker_info.sh' runs a series of commands which first check whether docker is installed, and then returns some information about Docker if it's located

For each of these scripts, diagnostics.sh tees the output to a file in /opt/threatstack/cloudsight/logs. Then, it calls 'tar_logs.sh', which tars that directory together (excluding tsaudit logs). From there, the customer can simply send us that tar file. If the customer wishes, they can encrypt the file with a PGP key. 
