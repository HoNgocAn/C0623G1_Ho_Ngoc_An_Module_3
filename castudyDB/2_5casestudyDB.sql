USE casestudy;

-- Câu 2
SELECT * 
FROM nhan_vien
WHERE CHAR_LENGTH(ho_ten) <=15 
AND (SUBString_INDEX(ho_ten,' ',-1) LIKE 'T%' 
OR SUBString_INDEX(ho_ten,' ',-1) LIKE 'H%' 
OR SUBString_INDEX(ho_ten,' ',-1) LIKE 'K%');

-- Câu 3
SELECT * 
    FROM khach_hang
    WHERE
    (YEAR(curdate())-YEAR(ngay_sinh))>18 
    AND (YEAR(curdate())-YEAR(ngay_sinh))<50 
    AND (dia_chi LIKE '%Đà Nẵng' 
    OR dia_chi LIKE '%Quảng Trị');
    
-- Câu 4
SELECT k.*, count(k.ma_khach_hang) AS "Số lần đặt phòng"
FROM khach_hang k
JOIN loai_khach l
ON	k.ma_loai_khach=l.ma_loai_khach
JOIN hop_dong h
ON k.ma_khach_hang=h.ma_khach_hang
WHERE l.ten_loai_khach="diamond"
GROUP BY k.ma_khach_hang
ORDER BY count(k.ma_khach_hang); 

-- Câu 5
SELECT k.ma_khach_hang, k.ho_ten,l.ten_loai_khach,h.ma_hop_dong,d.ten_dich_vu,h.ngay_lam_hop_dong, h.ngay_ket_thuc, d.ten_dich_vu,
(d.chi_phi_thue + hct.so_luong*dk.gia) as "Tổng tiền"
FROM hop_dong h
RIGHT JOIN khach_hang k 
ON h.ma_khach_hang = k.ma_khach_hang
JOIN loai_khach l
ON k.ma_loai_khach = l.ma_loai_khach
LEFT JOIN dich_vu d
ON h.ma_dich_vu = d.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hct
ON h.ma_hop_dong = hct.ma_hop_dong
LEFT JOIN dich_vu_di_kem dk
ON dk.ma_dich_vu_di_kem = hct.ma_dich_vu_di_kem;



