USE casestudy;

-- Câu 11
SELECT *
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
SELECT h.ma_hop_dong, n.ho_ten, k.ho_ten,k.so_dien_thoai,d.ten_dich_vu, h.tien_dat_coc , sum(hct.so_luong) AS "Số lượng dịch vụ đi kèm"
FROM hop_dong h
JOIN khach_hang k ON h.ma_khach_hang = k.ma_khach_hang
JOIN nhan_vien n ON h.ma_nhan_vien = n.ma_nhan_vien
JOIN dich_vu d ON h.ma_dich_vu = d.ma_dich_vu
JOIN hop_dong_chi_tiet hct ON h.ma_hop_dong = hct.ma_hop_dong
WHERE QUARTER(h.ngay_lam_hop_dong) = 4 AND YEAR(h.ngay_lam_hop_dong) = 2020
GROUP BY h.ma_hop_dong, n.ho_ten, k.ho_ten,k.so_dien_thoai,d.ten_dich_vu, h.tien_dat_coc;

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
SELECT h.ma_hop_dong, l.ten_loai_dich_vu, dk.ten_dich_vu_di_kem, count(dk.ma_dich_vu_di_kem) AS"Số lần sử dụng"
FROM dich_vu_di_kem dk
JOIN hop_dong_chi_tiet hct
ON dk.ma_dich_vu_di_kem = hct.ma_dich_vu_di_kem
JOIN hop_dong h 
ON hct.ma_hop_dong = h.ma_hop_dong
JOIN dich_vu d 
ON h.ma_dich_vu = d.ma_dich_vu
JOIN loai_dich_vu l 
ON d.ma_loai_dich_vu = l.ma_loai_dich_vu
GROUP BY dk.ma_dich_vu_di_kem,h.ma_hop_dong, l.ten_loai_dich_vu
HAVING  count(dk.ma_dich_vu_di_kem) =1;

-- Câu 15

SELECT n.ma_nhan_vien, n.ho_ten, t.ten_trinh_do, b.ten_bo_phan, n.so_dien_thoai, n.dia_chi, count(n.ma_nhan_vien) AS "Số lượng hợp đồng"
FROM hop_dong h
JOIN nhan_vien n ON n.ma_nhan_vien = h.ma_nhan_vien
JOIN trinh_do t ON n.ma_trinh_do = t.ma_trinh_do
JOIN bo_phan b ON b.ma_bo_phan = n.ma_bo_phan
WHERE h.ngay_lam_hop_dong>= "2020-1-1" AND h.ngay_lam_hop_dong<="2021-12-31"
GROUP BY n.ma_nhan_vien, n.ho_ten, t.ten_trinh_do, b.ten_bo_phan, n.so_dien_thoai, n.dia_chi
HAVING count(n.ma_nhan_vien)<=3;


