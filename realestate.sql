--creation
drop table office cascade constraint;
create table office 
(
    office_num number(3) ,
    zip number(5),
    city varchar2(8),
    state varchar2(10),
    emp_id char(4),
    constraint off_PK PRIMARY KEY(office_num)
);

drop table employee cascade constraint;
create table employee
(
    emp_id char(4),
    emp_name varchar2(30) constraint emp_nn not null,
    office_num number(3),
    constraint emp_PK PRIMARY KEY (emp_id),
    constraint emp_fk1 foreign key(office_num) references office(office_num)
);

drop table marriage cascade constraint;
create table marriage
(
    emp_id char(4),
    spouse_id char(4),
    married_date date,
    constraint marr_PK PRIMARY KEY (emp_id,spouse_id),
    constraint marr_fk1 foreign key(emp_id) references employee(emp_id),
    constraint marr_fk2 foreign key(spouse_id) references employee(emp_id)
);

drop table property cascade constraint;
create table property 
(
    Prop_ID char(4),
    zip number(5),
    city varchar2(8),
    state varchar2(10),
    office_num number(3),
    constraint prop_PK PRIMARY KEY (Prop_ID),
    constraint prop_fk foreign key(office_num) references office(office_num)
);


drop table owner cascade constraint;
create table owner 
(
    Owner_ID char(4),
    Owner_name varchar2(8) constraint owner_nn not null,
    constraint own_PK PRIMARY KEY (Owner_ID)
);

drop table prop_owner cascade constraint;
create table prop_owner 
(
    Prop_ID char(4),
    Owner_ID char(4),
    percent_owned number(3) default 100, 
    constraint prown_PK PRIMARY KEY (Prop_ID,Owner_ID),
    constraint prown_fk1 foreign key(Prop_ID) references Property (Prop_ID),
    constraint prown_fk2 foreign key(Owner_ID) references Owner (Owner_ID)
);

--------------------------------------------------------------------------------

-- insertion
insert into office values (111 , 36777, 'Riyadh','KSA','E100');
insert into office values (222 , 58888, 'Dammam','KSA','E200');
insert into office values (333 , 67777, 'Jeddah','KSA','E300');

insert into employee values ('E100','Ahmad',111);
insert into employee values ('E200','Sara',222);
insert into employee values ('E300','Tariq',333);
insert into employee values ('E400','Nada',222);
insert into employee values ('E500','Manal',222);

insert into Property values('P001',99766,'Riyadh','KSA',111);
insert into Property values('P002',43322,'Riyadh','KSA',333);
insert into Property values('P003',55966,'Jeddah','KSA',333);
insert into Property values('P004',88899,'Dammam','KSA',222);

insert into owner values ('O101','Khalid');
insert into owner values ('O102','Omar');
insert into owner values ('O103','Mohammad');
insert into owner values ('O104','Hatim');

insert into Prop_Owner values('P001','O101',100);
insert into Prop_Owner values('P002','O102',70);
insert into Prop_Owner values('P002','O101',30);
insert into Prop_Owner values('P003','O101',50);
insert into Prop_Owner values('P003','O103',50);
insert into Prop_Owner values('P004','O103',40);
insert into Prop_Owner values('P004','O102',60);

--------------------------------------------------------------------------------

-- Alter
Alter table office add Constraint off_fk foreign key(emp_id) references employee(emp_id);
