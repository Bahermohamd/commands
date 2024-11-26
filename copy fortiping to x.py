import os


def spawn():
	branchs = [17, 28, 29, 43, 21, 22, 49, 45, 55, 51, 40, 15, 33, 35, 39]
	for br in (branchs):
		os.mkdir(rf'\\10.20.{br}.10\d$\Forti_Ping')
		os.popen(rf'copy Forti_Ping\ \\10.20.{br}.10\d$\\Forti_Ping\\')
		path = rf'\\10.20.{br}.10\d$\Forti_Ping\Config.ini'	
		try:
			f = open(path, 'w')
			f.write(f"[Con]\nIP=10.20.{br}.2\nping=1.1.1.1\n\n[Setting]\nBR=500{'0' + str(br) if br < 10 else str(br)}\nTime=150\n\n")
			f.close()
			print(f"{br} is done")
	  
		except:
			print(f"{br} has error")
	
		

spawn()