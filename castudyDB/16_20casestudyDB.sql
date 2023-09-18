USE casestudy;

-- Câu 16
SELECT*
FROM hop_dong h
RIGHT JOIN nhan_vien n
ON h.ma_nhan_vien = n.ma_nhan_vien
WHERE h.ma_hop_dong IS NULL 
OR (h.ngay_lam_hop_dong < "2019-1-1" AND h.ngay_lam_hop_dong> "2021-12-31");

-- Câu 17
SELECT k.ma_khach_hang,k.ho_ten,l.ten_loai_khach,sum(d.chi_phi_thue+dk.gia*hct.so_luong)
FROM hop_dong h
JOIN khach_hang k
ON h.ma_khach_hang = k.ma_khach_hang
JOIN loai_khach l 
ON k.ma_loai_khach = l.ma_loai_khach
JOIN dich_vu d
ON h.ma_dich_vu = d.ma_dich_vu
JOIN hop_dong_chi_tiet hct
ON h.ma_hop_dong = hct.ma_hop_dong
JOIN dich_vu_di_kem dk
ON hct.ma_dich_vu_di_kem = dk.ma_dich_vu_di_kem
WHERE l.ten_loai_khach = "Platinum" 
AND YEAR(h.ngay_lam_hop_dong)=2021
GROUP BY k.ho_ten,k.ma_khach_hang,l.ten_loai_khach
HAVING sum(d.chi_phi_thue+dk.gia*hct.so_luong)>10000000;

-- Câu 18
SELECT k.ma_khach_hang, k.ho_ten
FROM hop_dong h 
JOIN khach_hang k
ON h.ma_khach_hang = k.ma_khach_hang
WHERE h.ngay_lam_hop_dong<="2021-12-31"
GROUP BY k.ho_ten,k.ma_khach_hang;

-- Câu 19
SELECT dk.*, count( dk.ma_dich_vu_di_kem) AS "Số lần sử dụng"
FROM hop_dong h
JOIN hop_dong_chi_tiet hct 
ON h.ma_hop_dong = hct.ma_hop_dong
JOIN dich_vu_di_kem dk 
ON hct.ma_dich_vu_di_kem = dk.ma_dich_vu_di_kem
GROUP BY dk.ma_dich_vu_di_kem
HAVING count( dk.ma_dich_vu_di_kem)>10;

-- câu 20
SELECT n.ma_nhan_vien, n.ho_ten, n.email, n.so_dien_thoai, n.ngay_sinh, n.dia_chi
FROM nhan_vien n
UNION
SELECT k.ma_khach_hang, k.ho_ten, k.email, k.so_dien_thoai, k.ngay_sinh, k.dia_chi
FROM khach_hang k;
