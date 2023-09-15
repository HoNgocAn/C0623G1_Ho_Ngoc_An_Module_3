USE casestudy;

SELECT * 
FROM nhan_vien
WHERE LENGTH(ho_ten) <=15 
AND (SUBString_INDEX(ho_ten,' ',-1) LIKE 'T%' 
OR SUBString_INDEX(ho_ten,' ',-1) LIKE 'H%' 
OR SUBString_INDEX(ho_ten,' ',-1) LIKE 'K%');

SELECT * 
    FROM khach_hang
    WHERE
    (YEAR(curdate())-YEAR(ngay_sinh))>18 
    AND (YEAR(curdate())-YEAR(ngay_sinh))<50 
    AND (dia_chi LIKE '%Đà Nẵng' 
    OR dia_chi LIKE '%Quảng Trị');
    
SELECT k.*, count(k.ma_khach_hang) 
FROM khach_hang k
JOIN loai_khach l
ON	k.ma_loai_khach=l.ma_loai_khach
JOIN hop_dong h
ON k.ma_khach_hang=h.ma_khach_hang
WHERE l.ten_loai_khach="diamond"
GROUP BY k.ma_khach_hang
ORDER BY count(k.ma_khach_hang); 
