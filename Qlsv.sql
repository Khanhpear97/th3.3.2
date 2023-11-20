create database QuanLySinhVien;
use QuanLySinhVien;

create table Class(
	ClassID int not null auto_increment primary key,
    ClassName varchar(60) not null,
    StartDate datetime not null,
    Status bit
);

create table Student(
	StudentID int not null auto_increment primary key,
    StudentName varchar(60),
    Address varchar(50),
    Phone varchar(20),
    Status bit,
    ClassID int not null,
    foreign key (ClassID) references Class (ClassID)
);

create table Subject(
	SubID int not null auto_increment primary key,
    Subname varchar(30),
    Credit tinyint not null default 1 check (Credit >= 1),
    Status bit default 1
);

create table Mark (
	MarkId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        SubID INT NOT NULL,
        StudentID INT NOT NULL,
        Mark FLOAT DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
        ExamTimes TINYINT DEFAULT 1,
        UNIQUE (SubId, StudentId),
        FOREIGN KEY (SubId) REFERENCES Subject (SubId),
        FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);

insert into Class
values (1, 'A1', '2008-12-20', 1);
insert into Class
values (2, 'A2', '2008-12-22', 1);
insert into Class
values (3, 'B3', current_date, 0);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

insert into Subject
values (1, 'CF', 5, 1),
(2, 'C', 6, 1),
(3, 'HDJ', 5, 1),
(4, 'RDBMS', 10, 1);

insert into Mark (SubID, StudentID, Mark, ExamTimes)
values (1, 1, 8, 1),
(1, 2, 10, 2),
(2, 1, 12, 1);

select *
from Student
where Status = true;

SELECT *
FROM Subject
WHERE Credit < 10;

SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID;

SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId;

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';