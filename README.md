# 🎓 Thiết Kế Phần Cứng và Hệ Thống SoC trên FPGA – Level 0 (Kria KV260)

Chào mừng bạn đến với **Level 0** trong series **Thiết kế phần cứng và hệ thống SoC trên FPGA**.  
Repository này chứa toàn bộ tài liệu, mã nguồn và hướng dẫn liên quan đến việc hiện thực một mô-đun phần cứng đơn giản và tích hợp vào hệ thống SoC trên bo mạch **Xilinx Kria KV260**.

---

## 📘 Giới thiệu

Trong Level 0 này, chúng ta sẽ hiện thực hàm toán học cơ bản:

> **Y = A × X + B**

bằng ngôn ngữ **Verilog HDL**, và tích hợp nó vào hệ thống SoC sử dụng **Vivado** và **PetaLinux**.

Bài học được thiết kế cho những người mới bắt đầu với phát triển hệ thống SoC trên nền FPGA.

---


1. ✅ **Xác định yêu cầu và đặc tả hệ thống**  
   → Vẽ sơ đồ khối, xác định tín hiệu vào/ra, chức năng cần thiết kế.

2. ✅ **Mô tả phần cứng bằng Verilog HDL và mô phỏng chức năng**  
   → Thiết kế mạch số đồng bộ và kiểm thử trên **Vivado Simulator**.

3. ✅ **Đóng gói IP (Package IP) trong Vivado**  
   → Thêm giao tiếp AXI4-Full để tích hợp vào hệ thống SoC.

4. ✅ **Tạo Block Design cho hệ thống SoC trên Vivado**  
   → Kết nối Zynq MPSoC và IP tự thiết kế thông qua AXI bus.

5. ✅ **Tổng hợp (Synthesis), Place & Route, và tạo file Bitstream**  
   → Xuất các file `.bit` và `.xsa` dùng cho phần mềm và PetaLinux.

6. ✅ **Thiết lập môi trường PetaLinux và tạo driver**  
   → Tạo project, cấu hình device tree, thêm UIO driver cho IP.

7. ✅ **Tạo image khởi động và rootfs cho Linux trên FPGA**  
   → Build các thành phần BOOT.BIN, kernel image và root filesystem.

8. ✅ **Phát triển phần mềm nhúng (Embedded C/C++)**  
   → Viết ứng dụng C để điều khiển IP thông qua giao tiếp PIO từ userspace.

---

📌 Mỗi bước trên sẽ được trình bày chi tiết trong video hướng dẫn tương ứng.  
 
[![Xem video demo](https://img.youtube.com/vi/F1vxzkd7_DI/0.jpg)](https://www.youtube.com/watch?v=F1vxzkd7_DI)


