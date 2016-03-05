update  student set age=20 where stu_id=0002 ;
select name from student order by age;
select name from student join ordering join course on student. where source<60;


create database db_sp;
create table s(
	sno char(10),
	sname char(6),
	status int(4),
	city char(10)

);
create table p(
	pno char(10),
	pname char(5),
	color char(6),
	weight float(4)
);
create table sp(
	sno char(10),
	pno char(6),
	jno char(6),
	qty int(6)
);
alter table sp add constraint PK_sp primary key(qty);
alter table sp add constraint FK_sp foreign key(pno) references p(pno);
alter table sp add constraint FK1_sp foreign key(sno) references s(sno);
alter table s add constraint PK_s primary key (sno);
alter table p add constraint PK_p primary key (pno);
alter table s modify column sname char(6) not null unique;
/*check在创建时指定，支持与否不清楚*/
alter table p add constraint CK_p check(color in ('red','yellow','blue'));
/*check(city!='london' or status=20)*/
alter table s alter set status=20 where city="London";
insert into p(color) values ('black');
update p set color='black';


insert into s values('s1','smith','20','london');
insert into s values('s2','jones','10','paris');
insert into s values('s3','blake','30','paris');
insert into s values('s4','clark','20','london');
insert into s values('s5','adams','30','athens');
insert into s values('s6','brown',null,"new york");


insert into p values('p1','nut','red','12'),
	('p2','bolt','green','17'),
	('p3','screw','blue','17'),
	('p4','screw','red','14'),
	('p5','cam','blue','12'),(
		'p6','cog','red','19');

create table sp (sno char(10),pno char(10),qty int(6));
insert into sp values('s1','p1','200'),
					('s1','p4','700'),
					('s1','p5','400'),
					('s2','p1','200'),
					('s2','p2','200'),
					('s2','p3','500'),
					('s2','p4','600'),
					('s2','p5','400'),
					('s2','p6','800'),
					('s3','p3','200'),
					('s3','p4','500'),
					('s4','p2','300'),
					('s4','p5','300'),
					('s5','p1','100'),
					('s5','p6','200'),
					('s5','p2','100'),
					('s5','p3','200'),
					('s1','p5','400');
select distinct sno from sp where pno='p1';
select sno,pno from sp where qty between 300 and 500;
select distinct s.sno,s.sname from s join p join sp on p.pno=sp.pno and sp.sno=s.sno where p.color='red';

select distinct p.pno,p.pname from p join sp join s on p.pno=sp.pno and sp.sno=s.sno  where  s.city='paris' and  p.weight<'15';
/*other*/
select pno,pname from p where weight<=15 and pno in (select pno from sp where sno in (select sno from s where city='paris') );
select pname from p where pno in (select pno from sp where sno in (select sno from s where city='london'));
/*failure*/
select distinct s.sname from s join p join sp on p.pno=sp.pno and sp.sno=s.sno where p.color !='red';
/*right*/
select sname from s where sno not in (select sno from sp join p on sp.pno=p.pno where color='red');
select sname from s where sno not in (select sno from sp where pno  in (select pno from p where color='red' ));

select pname from p where pno not in (select pno from sp where sno='s3');
/*difficult*/
select sname from s join sp on s.sno=sp.sno where pno='p1' and s.sno in (select sno from sp where pno='p2');

select a1.pno ,a1.pname from p a1,p a2 where a1.color=a2.color and a2.pname='nut' and a1.pname!='nut';
/*hard difficult*/
select sname from s where not exists (select * from p where not exists (select * from sp where s.sno=sp.sno and sp.pno=p.pno));





update p set weight=weight*0.2;
delete from s where status is null;



alter table tb_student add  constraint PK primary key();
create index index_name on tb_student();
drop index index_name on tb_student;


create view content_view as select * from content where name='mysql初学者' with check option;
create view v_score as select * from tb_score where score>90 wiht check option;
select studentNo,score from v_score where classNo='21002';
insert into v_score values('2014310101','31005',95);
delete from v_score where studentNo='2014310101';



create trigger content_delete_trigger after delete  on content for each row set @str='old content delete ';
create trigger tb_score_insert_trigger after insert on tb_score for each row set @sstr='new score added';
create trigger tb_score_update_trigger before update on tb_score for each row set score+=1;/*new.score=old.score+1*/
drop trigger if exists tb_score_insert_trigger; 









