import os, time
from time import gmtime, strftime

print("program started")
# {os.popen("tracert -d 8.8.8.8").read().split("\n")[4].split()[7]}
# {strftime("%Y-%m-%d %H:%M:%S", gmtime())}
while True:
	ip = os.popen("tracert -d 8.8.8.8").read().split("\n")[4].split()[7]
	tm = strftime("%Y-%m-%d %H:%M:%S", gmtime())
	print(f" {tm}  ---->>>  {ip}")
	time.sleep(600)
