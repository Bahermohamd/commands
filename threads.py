import os, multiprocessing, time





def ping(brs, cmd):
	start_time = time.time()

	for br in brs:
		for pos in (11, 12, 13, 14, 69):
			ip = "10.20." + str(br) + "." + str(pos)
			res = os.popen(f"ping {ip} -n 1").read()
			

			if res.find("Request timed out.") == -1 and res.find("100% loss") == -1:
				full_cmd = f"psexec \\\\{ip} {cmd} -nobanner"
				if cmd.find("powershell") != -1:
					full_cmd = full_cmd + " 2> $null"
				else:
					full_cmd = full_cmd + " 2> Nul"

				val = os.popen(full_cmd).read().replace("\n", "")

				if len(val):
					print(f"{ip}   {val}")
				else:
					print(f"{ip}   error")

			else:
				print(f"{ip} is down or not avaliable")

	print(f"thread {brs}--- %s seconds --- " % (time.time() - start_time))




if __name__ == "__main__":


        branchs = [8,]
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


                multiprocessing.Process(target=ping, args= (local_br, "hostname")).start().join()

        print("\n\nALL DONE\n")


