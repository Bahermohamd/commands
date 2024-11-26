import os, multiprocessing, shutil


def ping(brs, cmd):

	for br in brs:
		for pos in (11, 12, 13, 14, 15):
			ip = "10.20." + str(br) + "." + str(pos)
			res = os.popen(f"ping {ip} -n 1").read()
			

			if res.find("Request timed out.") == -1 and res.find("100% loss") == -1:
				
				os.popen(f"pskill  \\{ip} Microsoft.Dynamics.Commerce.StoreCommerce")
				try:
				    shutil.copy("Receipt.rdlc", f"\\\\{ip}\\C$\\Program Files\\Microsoft Dynamics 365\\10.0\\Store Commerce\\Extensions\\ALOthaim.POSCustomization\\HardwareStation\\")
				    print(f"{ip}  ->   Done")
				# If there is any permission issue
				except PermissionError:
				    print("Permission denied.")
				 
				# For other errors
				except:
				    print("Error occurred while copying file.")

			else:
				print(f"{ip} is down or not avaliable")





if __name__ == "__main__":


        branchs = [1,2,3,4,5,6,7,8,10,12,13,14,15,17,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,39,40,41,42,43,44,45,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61]
        cpus = os.cpu_count()
        pos = 0


        for i in range(cpus):

                if pos >= len(branchs): break

                if len(branchs[pos:])%(cpus-i) != 0:
                        local_br = branchs[pos : pos+1+int(len(branchs[pos:])/(cpus-i))]
                        pos = pos+1+int(len(branchs[pos:])/(cpus-i))

                else:
                        local_br = branchs[pos : pos+int(len(branchs[pos:])/(cpus-i))]
                        pos = pos+int(len(branchs[pos:])/(cpus-i))


                multiprocessing.Process(target=ping, args= (local_br, "hostname")).start()
