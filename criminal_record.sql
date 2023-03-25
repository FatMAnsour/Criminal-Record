create database criminal_record
use criminal_record
create table criminal(
criminal_id int identity(1,1) primary key not null,
criminal_dob varchar(50) not null,criminal_address varchar(100) not null,
criminal_FN varchar(50) not null ,criminal_MN varchar(50) not null,
criminal_LN varchar(50) not null , blood_type varchar(5) null , body_build varchar(1000) null ,
gender varchar(1) not null ,criminal_weight float null ,criminal_height float null ,
occupation varchar(100) not null , marital_statues varchar(10) 
);


create table nationalities(
nationality varchar(20) not null ,id_criminal int references criminal(criminal_id) not null
);


create table offence(
offence_id int identity(1,1) primary key not null , offence_type varchar(50) not null,
offence_place varchar(100) not  null , offence_time varchar(100) not null,

);


create table evidences(
evidence varchar(100) not null,
id_offence int references offence(offence_id) not null
);


create table criminal_history(
history_crID int not null,history_ofID int not null
primary key(history_crID,history_ofID ),foreign key(history_crID) references criminal(criminal_id),
foreign key (history_ofID)references offence(offence_id), charge varchar(100) not null,
sentence varchar(100) not null 
);
create table victim(
victim_id int identity(1,1) primary key not null , 
victim_age int not null, gender varchar(1) not null,
victim_FN varchar(50) not null ,victim_MN varchar(50) not null,
victim_LN varchar(50) not null ,victim_occupation varchar(20) not null,
country varchar(20) not null, id_offence int references offence(offence_id) not null
);


create table Administrator(
admin_id int identity(1,1) primary key not null , name varchar (100) not null ,
pass varchar(100) not null 
);

insert into criminal (criminal_dob,criminal_address,criminal_FN,criminal_MN,criminal_LN,blood_type,body_build,gender,criminal_weight,criminal_height,occupation,marital_statues)
VALUES ('3-1-2020','alex','bla','blo','blam',default,default,'female',60,170,'engineer','single');
  
  insert into nationalities (nationality)
  values ('egyption');

  insert into victim(victim_age,gender,victim_FN,victim_MN,victim_LN,victim_occupation,country)
  values(50,'male','ddd','fff','ggg','engineer','egypt');

  insert into offence(offence_type,offence_place,offence_time)
  values('dff','gghjh','11');

  insert into evidences(evidence)
  values ('ertyuyf');
