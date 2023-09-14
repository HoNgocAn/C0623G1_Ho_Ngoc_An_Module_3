USE casestudy;

SELECT * 
FROM nhan_vien
WHERE LENGTH(ho_ten) <=15 
AND (SUBString_INDEX(ho_ten,' ',-1) LIKE 'T%' 
OR SUBString_INDEX(ho_ten,' ',-1) LIKE 'H%' 
OR SUBString_INDEX(ho_ten,' ',-1) LIKE 'K%');

SELECT * 
    FROM khach_hang
	WHERE (DATEDIFF(DATE_ADD(ngay_sinh,INTERVAL 18 YEAR),NOW())<0 
    AND DATEDIFF(DATE_ADD(ngay_sinh,INTERVAL 50 YEAR),NOW())>=0)  
    AND (dia_chi LIKE '%Đà Nẵng' OR dia_chi LIKE '%Quảng Trị');
    