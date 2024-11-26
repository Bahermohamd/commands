import os


def ping(cmd):
	for br in (8, ):
		for pos in (11, 12, 13, 14, 69):
			ip = "10.20." + str(br) + "." + str(pos)
			res = os.popen(f"ping {ip} -n 1").read()

			

			if res.find("Request timed out.") == -1 and res.find("100% loss") == -1:
				if cmd.find("powershell"):
					cmd = cmd + " 2> $null"
				else:
					cmd = cmd + " 2> Nul"

				val = os.popen(f"psexec \\\\{ip} {cmd}").read()
				
				if len(val):
					print(f"{ip}   {val}")
				else:
					print(f"{ip}   error")

			else:
				print(f"{ip} is down or not avaliable")


ping("hostname")