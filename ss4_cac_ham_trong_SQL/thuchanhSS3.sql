USE QuanLySinhVien;
SELECT StudentName, COUNT(StudentId) AS "Số lương học viên"
FROM Student
GROUP BY StudentName;

SELECT S.StudentId,S.StudentName, AVG(Mark)
FROM Student S JOIN Mark M ON s.StudentId = M.StudentId
GROUP BY S.StudentId,S.StudentName;

SELECT S.StudentId,S.StudentName, AVG(Mark)
FROM Student S JOIN Mark M ON s.StudentId = M.StudentId
GROUP BY S.StudentId,S.StudentName
HAVING AVG(Mark)>15;

SELECT S.StudentId,S.StudentName, AVG(Mark)
FROM Student S JOIN Mark M ON s.StudentId = M.StudentId
GROUP BY S.StudentId,S.StudentName
HAVING AVG(Mark)>= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);
