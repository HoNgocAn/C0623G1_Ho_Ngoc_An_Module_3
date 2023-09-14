USE quanlysinhvien;
SELECT * 
FROM student
WHERE StudentName LIKE "H%";

SELECT *
FROM Class
WHERE month(startDate)=12;

SELECT * 
FROM subjects
WHERE Credit >= 3 AND Credit <=5 ;

UPDATE student 
SET ClassId = 2
WHERE StudentName = 'Hung';

SELECT S.StudentName, Su.SubName, M.Mark
FROM student s jOIN mark m ON s.StudentId = m.MarkId 
JOIN subjects Su ON m.MarkId = su.SubId
ORDER BY mark DESC;