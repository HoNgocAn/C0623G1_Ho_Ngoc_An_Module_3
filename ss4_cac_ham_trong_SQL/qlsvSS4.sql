USE QuanLySinhVien;

SELECT*FROM subjects
WHERE credit =
(SELECT max(credit)
FROM subjects);

SELECT s.subId, s.subName, s.credit, m.mark AS "Scrore"
FROM subjects s
LEFT JOIN mark m ON s.subId = m.subId
WHERE m.mark = (
SELECT MAX(mark)
FROM mark);

SELECT s.studentId,s.studentName, AVG(m.mark) AS "Medium Score"
FROM student s
JOIN mark m ON s.studentId = m.studentId
GROUP BY s.studentId
ORDER BY "Medium Score" DESC;
