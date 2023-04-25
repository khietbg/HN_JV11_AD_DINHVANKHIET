-- use test2
-- create table Subjects(
-- subjectID int(4) primary key auto_increment,
-- subjectName nvarchar(50)
-- );

-- create table classes(
-- classID int(4) primary key auto_increment,
-- className nvarchar(50)
-- );
-- create table students(
-- studentID int(4) primary key auto_increment,
-- studentName nvarchar(50),
-- age int(4),
-- email nvarchar(100)
-- );
-- create table Marks(
-- mark int,
-- subjectID int,
-- foreign key(subjectid) references subjects(subjectID),
-- studentID int,
-- foreign key(studentid) references students(studentID)
-- );
-- create table classStudent(
-- studentID int(4),
-- foreign key(studentid) references students(studentID),
-- classID int(4),
-- foreign key(classid) references classes(classID)
-- )

--  insert into  students(studentName,age,email) values
--  ("Nguyen Quang An",18,"an@yahoo.com"),
--  ("Nguyen Cong Vinh",20,"vinh@gmail.com"),
--  ("Nguyen Van Quyen",19,"quyen"),
--  ("Pham Thanh Binh",25,"binh@gmail.com"),
--  ("Nguyen Van Tai Em",30,"taiem@gmail.com")
--  ;

 -- insert into classes(className) values("C0706L"),("C0708G");
--  insert into classStudent(StudentID,ClassID) values
--  (1,1),(2,1),(3,2),(4,2),(5,2);
-- insert into subjects(subjectName) values
-- ("SQL"),("Java"),("C"),("Visual Basic");

-- insert into Marks(mark,subjectID,studentID) values
-- (8,1,1),(4,2,1),(9,1,1),(7,1,3),(3,1,4),(5,2,5),(8,3,3),(1,3,5),(3,2,4)
-- ;

-- 1. Hien thi danh sach tat ca cac hoc vien
select * from students;

-- 2. Hien thi danh sach tat ca cac mon hoc
select * from subjects;

-- 3. Tinh diem trung binh
 select avg(mark)as `diem trung binh` from marks;
 
 -- 4. Hien thi mon hoc nao co hoc sinh thi duoc diem cao nhat
select sb.subjectName,mark from marks m join subjects sb on m.subjectid = sb.subjectid where mark=(select max(mark) from marks );

-- 5. Danh so thu tu cua diem theo chieu giam

 select @stt:=@stt+1 as stt ,m.* from (select @stt:=0) r, marks m order by mark desc;
 
 -- 6. Thay doi kieu du lieu cua cot SubjectName trong bang Subjects thanh nvarchar(max)
  alter table Subjects
  modify subjectName nvarchar(255);
  
  -- 7. Cap nhat them dong chu « Day la mon hoc « vao truoc cac ban ghi tren cot SubjectName trong bang Subjects
  update Subjects
  set SubjectName = concat("day la bom hoc ",SubjectName);
  select * from subjects;
  
  -- 8.Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
   alter table students
   modify age int check (age >15 and Age < 50);
   
   -- 9.Loai bo tat ca quan he giua cac bang
alter table classStudent
drop foreign key classstudent_ibfk_1,
drop foreign key classstudent_ibfk_2;
alter table marks
drop foreign key marks_ibfk_1,
drop foreign key marks_ibfk_2;

-- 10. Xoa hoc vien co StudentID la 1
delete from students
where studentId = 1;

-- 11.Trong bang Student them mot column Status co kieu du lieu la Bit va co gia tri Default la 1
alter table students 
add column `status` bit default 1;

-- 12.Cap nhap gia tri Status trong bang Student thanh 0
update students
set `status` = 0;
   
