declare @user INT
set @user = (select userid from userinfo where badgenumber = '205663')
select top 10 checktime,sensorid from checkinout where userid = @user order by checktime desc
go

--example for inner join
--SELECT top 50 CHECKTIME,CHECKTYPE,SENSORID 
--from checkinout --frist table
--INNER JOIN USERINFO  --second table 
--ON userinfo.userid = checkinout.userid where USERINFO.BADGENUMBER = '205663' order by CHECKINOUT.CHECKTIME des