
----------------------------SQL_TASK-1 ----------------------------------------------------------
-----Create  6 table and Insert 10 records in each table.
-----Following table are created for the task.
-----1.university_info
-----2.college
-----3.deparments
-----4.branch
-----5.student
-----5.student__branch
------------------------------------------------------------------------------------------
-----university

create table university_info(
  	uni_id    int  primary key,
	uni_code  varchar unique,
	uni_name  varchar not null,
	address   varchar,
	phone_no  int,
	inst_date date,
	website   varchar
	);
-----alter operation done for change phone no column datatype.	
alter table university_info
alter column phone_no type varchar;

-----Insert 10 rows into university_info table

INSERT INTO university_info (
            uni_id, uni_code, uni_name, address, phone_no, inst_date, website
			)
VALUES
			(1, 'RTMNU001', 'Rashtrasant Tukadoji Maharaj Nagpur University', 'Amravati Road,Nagpur,Maharashtra,India', 7122533452, '1923-08-01', 'https://www.nagpuruniversity.ac.in'),
			(2, 'MU002', 'University of Mumbai','Mumbai,Maharashtra, India', 2222652819, '1857-07-18', 'https://mu.ac.in'),
			(3, 'SPPU003', 'Savitribai Phule Pune University', 'Pune, Maharashtra, India', 2025601333, '1949-02-10', 'http://www.unipune.ac.in'),
			(4, 'BAMU004', 'Dr. Babasaheb Ambedkar Marathwada University', 'Aurangabad, Maharashtra, India', 2402403399, '1958-08-23', 'https://www.bamu.ac.in'),
			(5, 'NMU005', 'Kavayitri Bahinabai Chaudhari North Maharashtra University', 'Jalgaon, Maharashtra, India', 2572258403, '1990-08-15', 'https://nmu.ac.in'),
			(6, 'SGBAU006', 'Sant Gadge Baba Amravati University', 'Amravati, Maharashtra, India', 7212662358, '1983-05-01', 'https://www.sgbau.ac.in'),
			(7, 'SU007', 'Shivaji University', 'Kolhapur, Maharashtra, India', 2312609000, '1962-11-18', 'https://www.unishivaji.ac.in'),
			(8, 'SNDT008', 'SNDT Women’s University', 'Mumbai, Maharashtra, India', 2222001789, '1916-07-05', 'https://sndt.ac.in'),
			(9, 'MUHS009', 'Maharashtra University of Health Sciences', 'Nashik, Maharashtra, India', 2532539111, '1998-06-10', 'https://www.muhs.ac.in'),
			(10,'YCMOU010', 'Yashwantrao Chavan Maharashtra Open University', 'Nashik, Maharashtra, India', 2532231714, '1989-07-01', 'https://ycmou.ac.in');

--------------------------------------------------------------------------------------------------------------------------------------------------
-----2. College (each belongs to a university)

CREATE TABLE college (
	         college_id       serial primary key,
			 university_id    int    not null references university_info(uni_id),
	         name             VARCHAR not null,
			 founded_year     int    not null,
			 num_departments  int,
			 dean             varchar
			 );

------Insert 10 rows into college table

INSERT INTO  college (
    		 university_id, name, founded_year, num_departments, dean
			 )
VALUES      (1, 'Government College of Engineering, Nagpur', 1960, 12, 'Dr. S. V. Deshmukh'),
			(1, 'Shri Ramdeobaba College of Engineering and Management', 1984, 14, 'Dr. R. S. Pande'),
			(1, 'G. H. Raisoni College of Engineering', 1996, 16, 'Dr. Preeti Bajaj'),
			(1, 'St. Francis De Sales College', 1956, 10, 'Dr. A. K. Sharma'),
			(1, 'Dr. Ambedkar College, Nagpur', 1964, 11, 'Dr. Meena Joshi'),
			(1, 'Anjuman College of Engineering and Technology', 1999, 9, 'Dr. M. A. Khan'),
			(1, 'Dhanwate National College', 1935, 8, 'Dr. Rekha Nair'),
			(1, 'Smt. Radhadevi Goenka College for Women', 1989, 7, 'Dr. Lata More'),
			(1, 'Central India College of Law', 2006, 6, 'Dr. Ajay Jadhav'),
			(1, 'JD College of Engineering and Management', 2008, 13, 'Dr. Neha Shinde');
-------------------------------------------------------------------------------------------------------------
	
-----3.deparments

create table deparments(
    		 deparment_id     serial primary key,
			 college_id       serial not null references college(college_id),
			 name             varchar  not  null,
			 establish_year   int   not null,
			 hod_name         varchar,
			 no_of_faculties  int
			 );

------Insert 10 rows into deparments table	

INSERT INTO deparments (
            college_id, name, establish_year, hod_name, no_of_faculties
			)
VALUES     (1, 'Computer Science and Engineering', 2016, 'Dr. A. R. Wankhede', 10),
			(1, 'Electronics and Telecommunication Engineering', 2016, 'Dr. S. V. Deshmukh', 9),
			(1, 'Electrical Engineering', 2016, 'Dr. R. P. Borkar', 8),
			(1, 'Mechanical Engineering', 2016, 'Dr. M. B. Daigawane', 11),
			(1, 'Civil Engineering', 2016, 'Dr. N. M. Borkar', 10),
			(1, 'Applied Sciences and Humanities', 2016, 'Dr. Meenal Kulkarni', 7),
			(1, 'Information Technology', 2017, 'Dr. Rekha Nair', 6),
			(1, 'Artificial Intelligence and Data Science', 2020, 'Dr. Neha Shinde', 5),
			(1, 'Environmental Engineering', 2018, 'Dr. Ajay Jadhav', 4),
			(1, 'Instrumentation Engineering', 2019, 'Dr. Lata More', 6);

------------------------------------------------------------------------------------------------------------	
-----4.branch

create table branch(
             branch_id     serial  primary key,
			 deparment_id  serial  not null references deparments(deparment_id),
			 name          varchar not null,
			 total_seat    int     not null,
			 seat_filled   int     not null,
			 branch_head   varchar
			 );
	
alter table branch 
alter column deparment_id type int;

------Insert 10 rows into branch table

INSERT INTO branch (
            deparment_id, name, total_seat, seat_filled, branch_head
			)
VALUES      (4, 'Thermal Engineering', 60, 58, 'Dr. S. V. Deshmukh'),
			(4, 'Design Engineering', 60, 55, 'Dr. A. R. Wankhede'),
			(4, 'Production Engineering', 60, 52, 'Dr. M. B. Daigawane'),
			(4, 'Automobile Engineering', 60, 59, 'Dr. N. M. Borkar'),
			(4, 'Industrial Engineering', 60, 50, 'Dr. Rekha Nair'),
			(4, 'Mechatronics', 60, 53, 'Dr. Neha Shinde'),
			(4, 'Robotics and Automation', 60, 56, 'Dr. Ajay Jadhav'),
			(4, 'CAD/CAM', 60, 54, 'Dr. Lata More'),
			(4, 'Energy Systems', 60, 51, 'Dr. P. S. Kale'),
			(4, 'Advanced Manufacturing', 60, 57, 'Dr. K. G. Joshi');
------------------------------------------------------------------------------------------------------	
-----5.student  

create table student(
 	std_id           serial primary key,
	branch_id        serial not null references branch(branch_id),
	first_name       varchar not null,
	last_name	 	 varchar not null,
	dob 			 date,
	gpa              int,
	percentage       double precision,
	email_id         varchar,
	enrollment_date  date
	);

------Insert 10 rows into student table

INSERT INTO student (
    		branch_id, first_name, last_name, dob, gpa, percentage, email_id, enrollment_date
			)
VALUES     (4, 'Aarav', 'Deshmukh', '2004-06-15', 8, 78.5, 'aarav.deshmukh@gcoen.ac.in', '2022-08-01'),
		   (4, 'Sneha', 'Patil', '2003-11-22', 9, 84.2, 'sneha.patil@gcoen.ac.in', '2022-08-01'),
		   (4, 'Rohan', 'Joshi', '2004-01-10', 7, 72.0, 'rohan.joshi@gcoen.ac.in', '2022-08-01'),
           (4, 'Isha', 'Kulkarni', '2003-09-05', 8, 79.3, 'isha.kulkarni@gcoen.ac.in', '2022-08-01'),
		   (4, 'Yash', 'Shinde', '2004-03-18', 6, 65.7, 'yash.shinde@gcoen.ac.in', '2022-08-01'),
           (4, 'Pooja', 'More', '2003-12-30', 9, 88.1, 'pooja.more@gcoen.ac.in', '2022-08-01'),
           (4, 'Kunal', 'Borkar', '2004-05-25', 7, 71.4, 'kunal.borkar@gcoen.ac.in', '2022-08-01'),
           (4, 'Neha', 'Jadhav', '2003-07-14', 8, 80.0, 'neha.jadhav@gcoen.ac.in', '2022-08-01'),
           (4, 'Siddharth', 'Naik', '2004-02-08', 7, 74.6, 'siddharth.naik@gcoen.ac.in', '2022-08-01'),
           (4, 'Ritika', 'Sawant', '2003-10-19', 8, 82.3, 'ritika.sawant@gcoen.ac.in', '2022-08-01');
---------------------------------------------------------------------------------------------------------	
------6.student branch

create table student_branch(
	std_id           serial not null references student(std_id),
	branch_id        serial not null references branch(branch_id),
	enrolled_on      date   not null default current_date,
	grade            varchar,
	total_fees       int,
	paid_fees        int
	);

------Insert 10 rows into branch table

INSERT INTO student_branch (
            std_id, branch_id,enrolled_on, grade, total_fees, paid_fees)
VALUES		(11, 4, '2022-08-01', 'A', 116336, 116336),
			(12, 4, '2022-08-01', 'A+', 116336, 116336),
			(13, 4, '2022-08-01', 'B+', 116336, 110000),
			(14, 4, '2022-08-01', 'A', 116336, 116336),
			(15, 4, '2022-08-01', 'B', 116336, 100000),
			(16, 4, '2022-08-01', 'A+', 116336, 116336),
			(17, 4, '2022-08-01', 'B+', 116336, 105000),
			(18, 4, '2022-08-01', 'A', 116336, 116336),
			(19, 4, '2022-08-01', 'B', 116336, 98000),
			(20, 4, '2022-08-01', 'A', 116336, 116336);
-----------------------------------------------------------------------------
-----select statements for all the tables.
select * from  university_info;
select * from  college;
select * from  deparments;	
select * from  branch;
select * from  student;
select * from  student_branch;
----------------------------- END TASK -------------------------------------------	















