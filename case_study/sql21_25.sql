-- 21.	Tạo khung nhìn có tên là v_nhan_vien 
-- để lấy được thông tin của tất cả các nhân viên 
-- có địa chỉ là “Hải Châu” và đã từng lập hợp đồng 
-- cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.

 create view v_nhan_vien as 
 select n.ma_nhan_vien, n.ho_ten, n.so_dien_thoai, n.dia_chi
 from nhan_vien n
 join hop_dong h on n.ma_nhan_vien = h.ma_nhan_vien
 where n.dia_chi like "%Hải Châu%" and h.ngay_lam_hop_dong >= '2019-12-12' ;

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện 
--  cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên 
-- được nhìn thấy bởi khung nhìn này.

 update  v_nhan_vien 
 set v_nhan_vien.dia_chi = replace(v_nhan_vien.dia_chi, 'Hải Châu', 'Liên Chiểu')
 where v_nhan_vien.dia_chi like '%Hải Châu%';

--  23.	Tạo Stored Procedure sp_xoa_khach_hang 
-- dùng để xóa thông tin của một khách hàng nào đó với 
-- ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.

delimiter //
create procedure sp_xoa_khach_hang (in ma_khach_hang_xoa int) 
begin 
set sql_safe_updates = 0;
delete from khach_hang 
where khach_hang.ma_khach_hang = ma_khach_hang_xoa;
set sql_safe_updates = 1;
END //
DELIMITER ;
call sp_xoa_khach_hang(2);
select * from khach_hang;


-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong 
-- dùng để thêm mới vào bảng hop_dong với yêu cầu 
-- sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
-- với nguyên tắc không được trùng khóa chính 
-- và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
delimiter //
 create procedure sp_them_moi_hop_dong (
 in new_ma_hop_dong INT ,
 in new_ngay_lam_hop_dong DATETIME ,
 in new_ngay_ket_thuc DATETIME ,
 in new_tien_dat_coc DOUBLE,
 in new_ma_nhan_vien INT,
 in new_ma_khach_hang INT,
 in new_ma_dich_vu INT
 )
 begin 
 insert into hop_dong (ma_hop_dong,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,
 ma_nhan_vien,ma_khach_hang,ma_dich_vu)
 values (new_ma_hop_dong,new_ngay_lam_hop_dong,new_ngay_ket_thuc,
 new_tien_dat_coc,new_ma_nhan_vien,new_ma_khach_hang,new_ma_dich_vu);
end //
delimiter ;
call sp_them_moi_hop_dong(20,'2023-06-21','2023-07-24',50000,1,2,3);
select*from hop_dong;

-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng 
-- hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng
--  hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.

delimiter //
  CREATE TRIGGER tr_xoa_hop_dong  
after DELETE ON hop_dong
FOR EACH ROW
BEGIN
    DECLARE count INT;
    SELECT COUNT(*) INTO count FROM hop_dong;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = CONCAT('So luong ban ghi con lai trong bang hop_dong: ',count);
END //

delimiter ;

set sql_safe_updates=0;
delete from hop_dong h
where h.ma_hop_dong =5;
set sql_safe_updates = 1;

select*
from hop_dong;


-- SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = CONCAT('So luong ban ghi con lai trong bang hop_dong: ', CAST(count AS CHAR));
