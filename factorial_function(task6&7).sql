use db
create function dbo.factorials(@i int) 
returns int
as
begin
	declare @fact int;
	set @fact=1;
	if @i<0
		return null
	while @i>0
	begin
		set @fact=@fact*@i;
		set @i=@i-1;
	end
	return @fact
end
drop table facto
create table facto (input int, factorial_result int)
declare @input1 int=5
insert into facto(input, factorial_result) values(@input1,dbo.factorials(@input1))
declare @input2 int=7
insert into facto(input, factorial_result) values(@input2,dbo.factorials(@input2))
declare @input3 int=9
insert into facto(input, factorial_result) values(@input3,dbo.factorials(@input3))
declare @input4 int=10
insert into facto(input, factorial_result) values(@input4,dbo.factorials(@input4))
declare @input5 int=2
insert into facto(input, factorial_result) values(@input5,dbo.factorials(@input5))
declare @input6 int=12

delete from facto where factorial_result=120






