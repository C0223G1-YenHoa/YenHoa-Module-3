create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;

create table class(
class_id int primary key not null auto_increment,
class_name varchar(60) not null,
start_date datetime not null,
status bit
);

create table student(
student_id int primary key auto_increment not null,
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
status bit,
class_id int not null,
foreign key (class_id) references class(class_id)
);

create table subjects(
sub_id int primary key not null auto_increment,
sub_name varchar(30) not null,
credit tinyint not null default 1 check (credit>=1),
status bit default 1
);

create table Mark (
mark_id int primary key auto_increment not null,
sub_id int not null,
student_id int not null,
phone varchar(20),
mark float default 0 check (mark between 0 and 100),
exam_times tinyint default 1,
unique (sub_id,student_id),
foreign key (sub_id) references subjects(sub_id),
foreign key (student_id) references student(student_id)
);

INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO class
VALUES (3, 'B3', current_date, 0);

INSERT INTO student (student_name, address, phone, status, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (student_name, address, status, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (student_name, address, phone, status, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subjects
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO mark (sub_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
       select *
       from student
       where substring_index(student.student_name," ",-1) like "H%";
       
       select *
       from class
       where month(start_date)=12;
       
       select*
       from subjects
       where credit between 3 and 5;
       
       set sql_safe_updates=0;
       update student set class_id = 2 
       where substring_index(student.student_name," ",-1)="hung";
       set sql_safe_updates=1;
       
       select student.student_name,subjects.sub_name,mark
       from mark 
       join student on mark.student_id=student.student_id
       join subjects on subjects.sub_id=subjects.sub_id
       order by mark.mark desc;
       
       select *
       from subjects
       order by credit desc
	   limit 1;
       
       select subjects.sub_name, mark.mark
       from mark
       join subjects on mark.sub_id=subjects.sub_id
       where mark.mark=(
       select max(mark) from mark
       );
       
      select student.*,avg(mark.mark) as diem_trung_binh
      from student 
      join mark on student.student_id=mark.student_id
      group by student.student_id
      order by avg(mark.mark) desc;
	

       
       
       