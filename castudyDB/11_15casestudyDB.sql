USE casestudy;

-- Câu 11
SELECT dk.*,k.ho_ten,k.dia_chi,l.ten_loai_khach 
FROM dich_vu_di_kem dk
JOIN hop_dong_chi_tiet hct
ON dk.ma_dich_vu_di_kem = hct.ma_dich_vu_di_kem
JOIN hop_dong h 
ON hct.ma_hop_dong = h.ma_hop_dong
JOIN khach_hang k 
ON h.ma_khach_hang = k.ma_khach_hang
JOIN loai_khach l
ON k.ma_loai_khach = l.ma_loai_khach
WHERE l.ten_loai_khach = "Diamond" AND (k.dia_chi LIKE "%Vinh" OR k.dia_chi LIKE "%Quảng Ngãi");

-- Câu 12
SELECT h.ma_hop_dong, n.ho_ten AS "Tên nhân viên", k.ho_ten AS "Tên khách hàng", k.so_dien_thoai AS "SĐT khách hàng",
d.ten_dich_vu, h.tien_dat_coc , sum(ifnull(hct.so_luong,0)) AS "Số lượng dịch vụ đi kèm"
FROM hop_dong h
JOIN khach_hang k ON h.ma_khach_hang = k.ma_khach_hang
JOIN nhan_vien n ON h.ma_nhan_vien = n.ma_nhan_vien
JOIN dich_vu d ON h.ma_dich_vu = d.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hct ON h.ma_hop_dong = hct.ma_hop_dong
WHERE QUARTER(h.ngay_lam_hop_dong) = 4 AND YEAR(h.ngay_lam_hop_dong) = 2020
AND d.ma_dich_vu NOT IN 
(SELECT ma_dich_vu
FROM hop_dong
WHERE ngay_lam_hop_dong BETWEEN "2021-1-1" AND "2021-6-30")
GROUP BY h.ma_hop_dong;

-- Câu 13
SELECT dk.*, count(dk.ma_dich_vu_di_kem) AS "Số lần sử dụng dịch vụ đi kèm"
FROM dich_vu_di_kem dk
JOIN hop_dong_chi_tiet hct
ON dk.ma_dich_vu_di_kem = hct.ma_dich_vu_di_kem
JOIN hop_dong h 
ON hct.ma_hop_dong = h.ma_hop_dong
JOIN khach_hang k 
ON h.ma_khach_hang = k.ma_khach_hang
GROUP BY dk.ma_dich_vu_di_kem
HAVING count(dk.ma_dich_vu_di_kem)
ORDER BY count(dk.ma_dich_vu_di_kem) DESC
LIMIT 3;

-- Câu 14
SET sql_mode = 0;
SELECT hct.ma_hop_dong, l.ten_loai_dich_vu,dk.ten_dich_vu_di_kem,count(dk.ma_dich_vu_di_kem) AS "Số lần sử dụng"
FROM dich_vu_di_kem dk
JOIN hop_dong_chi_tiet hct
ON dk.ma_dich_vu_di_kem = hct.ma_dich_vu_di_kem
JOIN hop_dong h 
ON hct.ma_hop_dong = h.ma_hop_dong
RIGHT JOIN dich_vu d 
ON h.ma_dich_vu = d.ma_dich_vu
RIGHT JOIN loai_dich_vu l 
ON d.ma_loai_dich_vu = l.ma_loai_dich_vu
GROUP BY dk.ma_dich_vu_di_kem
HAVING count(dk.ma_dich_vu_di_kem) = 1;

-- Câu 15

SELECT n.ma_nhan_vien, n.ho_ten, t.ten_trinh_do, b.ten_bo_phan, n.so_dien_thoai, n.dia_chi, count(n.ma_nhan_vien) AS "Số lượng hợp đồng"
FROM hop_dong h
JOIN nhan_vien n ON n.ma_nhan_vien = h.ma_nhan_vien
LEFT JOIN trinh_do t ON n.ma_trinh_do = t.ma_trinh_do
LEFT JOIN bo_phan b ON b.ma_bo_phan = n.ma_bo_phan
WHERE h.ngay_lam_hop_dong BETWEEN "2020-1-1" AND "2021-12-31"
GROUP BY n.ma_nhan_vien
HAVING count(n.ma_nhan_vien)<=3;