USE casestudy;

-- Câu 16
SELECT h.ma_nhan_vien
FROM hop_dong h
JOIN nhan_vien n
ON h.ma_nhan_vien = n.ma_nhan_vien
WHERE h.ngay_lam_hop_dong BETWEEN "2019-1-1" AND "2021-12-31";

-- Câu 17
SELECT k.ma_khach_hang,k.ho_ten,l.ten_loai_khach,sum(d.chi_phi_thue+dk.gia*hct.so_luong) AS "Tổng tiền"
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
GROUP BY k.ma_khach_hang
HAVING sum(d.chi_phi_thue+dk.gia*hct.so_luong)>1000000;

-- Câu 18
SELECT k.ma_khach_hang, k.ho_ten
FROM hop_dong h 
JOIN khach_hang k
ON h.ma_khach_hang = k.ma_khach_hang
WHERE h.ngay_lam_hop_dong<="2021-12-31"
GROUP BY k.ho_ten,k.ma_khach_hang;

-- Câu 19
UPDATE dich_vu_di_kem 
SET gia = gia * 2
WHERE ma_dich_vu_di_kem IN (
SELECT dk.ma_dich_vu_di_kem ,sum(hct.so_luong) AS "Số lần sử dụng"
FROM hop_dong h
JOIN hop_dong_chi_tiet hct 
ON h.ma_hop_dong = hct.ma_hop_dong
JOIN dich_vu_di_kem dk 
ON hct.ma_dich_vu_di_kem = dk.ma_dich_vu_di_kem
WHERE YEAR(h.ngay_lam_hop_dong) = 2020
GROUP BY dk.ma_dich_vu_di_kem
HAVING sum(hct.so_luong)>10);

-- câu 20
SELECT n.ma_nhan_vien AS "Mã", n.ho_ten AS "Họ tên", n.email, n.so_dien_thoai, n.ngay_sinh, n.dia_chi
FROM nhan_vien n
UNION
SELECT k.ma_khach_hang AS "Mã", k.ho_ten AS "Họ tên", k.email, k.so_dien_thoai, k.ngay_sinh, k.dia_chi
FROM khach_hang k;
