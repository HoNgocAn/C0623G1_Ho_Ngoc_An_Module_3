USE QuanLySinhVien;

SELECT * FROM Student;

SELECT * 
FROM Student
WHERE StatusST = true; 

SELECT*
FROM Subjects
WHERE Credit<10;

SELECT *
FROM Student S join Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';

SELECT *
FROM Student S JOIN Mark M ON S.StudentId = M.StudentId  JOIN Subjects Sub ON M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';



