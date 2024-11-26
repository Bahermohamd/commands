import os


def delete():
	os.system("cls")
	badge = int(input("badgenumber..\n"))
	records = int(input("records..\n"))
	query = f"select top {records} checktime, checktype, sensorid from checkinout where userid = (select userid from userinfo where badgenumber = '{badge}') order by checktime desc"
	res = os.popen(f"sqlcmd -S 10.20.0.25 -U sa -P 14982752* -d ZKTeco_DB -Q \"{query}\"").read()
	print(res)
	arr = res.split("\n")

	ans = int(input("delete record number....\n"))
	print(f"this record will be deleted   {arr[ans+1]}")
	time = str(arr[ans+1].split()[0] + " " + arr[ans+1].split()[1])
	query = f"delete from checkinout where userid = (select userid from userinfo where badgenumber = '{badge}') and checktime = '{time}'"
	res = os.popen(f"sqlcmd -S 10.20.0.25 -U sa -P 14982752* -d ZKTeco_DB -Q \"{query}\"").read()
	print(res)



def qury():
	os.system("cls")
	badge = int(input("badgenumber..\n"))
	records = int(input("records..\n"))
	query = f"select top {records} checktime, checktype, sensorid from checkinout where userid = (select userid from userinfo where badgenumber = '{badge}') order by checktime desc"
	res = os.popen(f"sqlcmd -S 10.20.0.25 -U sa -P 14982752* -d ZKTeco_DB -Q \"{query}\"").read()
	print(res)


if __name__ == "__main__":
	i = int(input("\n\n1-query\n2-delete record\n\n"))
	if i == 1:
		qury()
	elif i == 2:
		delete()
	else:
		exit()