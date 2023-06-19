use case_study;

select *
from khach_hang;

select *
from nhan_vien
where ho_ten like "H%" or ho_ten like "T%" or ho_ten like "K%" and length(ho_ten)<16 ;

select *
from khach_hang 
where datediff(now(), ngay_sinh)/365 >=18 and datediff(now(), ngay_sinh)/365 <=50 
and dia_chi like "%Quảng Trị%" or dia_chi like "%Đà Nẵng%";

select khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, count(*) as 'so_lan_dat'
from khach_hang
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where loai_khach.ten_loai_khach = "Diamond"
group by hop_dong.ma_khach_hang
order by so_lan_dat;

SELECT 
    k.ma_khach_hang,
    k.ho_ten,
    loai_khach.ten_loai_khach,
    hop_dong.ma_hop_dong,
    dich_vu.ten_dich_vu,
    hop_dong.ngay_lam_hop_dong,
    hop_dong.ngay_ket_thuc,
    dich_vu.chi_phi_thue + hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia AS tong_tien
FROM
    khach_hang  k
        LEFT JOIN
    loai_khach ON k.ma_loai_khach = loai_khach.ma_loai_khach
        LEFT JOIN
    hop_dong ON k.ma_khach_hang = hop_dong.ma_khach_hang
        LEFT JOIN
    dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem;





