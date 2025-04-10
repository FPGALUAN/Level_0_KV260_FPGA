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

---

## 💻 Thiết bị cần thiết

Dưới đây là danh sách các thiết bị phần cứng cần chuẩn bị để thực hành Level 0 trên bo mạch **Kria KV260 FPGA**.

![Thiết bị cần thiết](Hinh/Hinh_1.png)

### 📦 Danh sách thiết bị:

- **Kria KV260 FPGA**  
  → Bo mạch chính dùng để triển khai hệ thống SoC và chạy ứng dụng nhúng.

- **Dây cáp mạng (LAN)**  
  → Dùng để kết nối FPGA với Internet thông qua router/switch, hỗ trợ cập nhật và debug qua SSH.

- **Dây JTAG**  
  → Kết nối từ FPGA đến Server PC để nạp bitstream, debug hoặc hoạt động như dây UART để hiện thị console của Linux trên FPGA.

- **Thẻ nhớ MicroSD và đầu đọc thẻ**  
  → Dùng để tạo image khởi động (BOOT.BIN + Linux kernel + rootfs) và cài hệ điều hành cho FPGA.

- **Server PC (Linux)**  
  → Cài đặt công cụ thiết kế phần cứng (Vivado), công cụ PetaLinux, và thực hiện build toàn bộ hệ thống.

- **Laptop/PC cá nhân (Windows hoặc Linux)**  
  → Dùng để kết nối SSH đến Server, hoặc truyền file (WinSCP).  
  → Nếu dùng Windows, cần cài **VMware** để chạy Linux.

📌 **Lưu ý:**  
Bạn có thể thay thế **1 Server PC và 1 Laptop/PC** thành **1 Laptop/PC duy nhất**, miễn là máy có cài đặt Linux để cài PetaLinux.

---

## 🧰 Chuẩn bị và kết nối thiết bị

Trước khi bắt đầu quy trình thiết kế phần cứng, cần kết nối và thiết lập các thiết bị như sau:

- **KV260 FPGA**: kết nối với router qua **dây mạng** để có internet, và kết nối với Server PC qua **dây JTAG** để nạp bitstream, debug.
- **Server PC**: dùng để cài **Vivado** và **Petalinux**, kết nối mạng và đầu đọc thẻ nhớ để chuẩn bị Linux cho FPGA.
- **Laptop**: sử dụng để điều khiển Server PC và KV260 thông qua **kết nối SSH** (qua MobaXterm, VSCode, hoặc Terminal).

⚠️ **Lưu ý**:  
- Server PC và Laptop cần nằm chung mạng nội bộ (LAN/WiFi).
- Thẻ nhớ microSD sẽ được dùng để nạp hệ điều hành Linux vào FPGA.

![Kết nối thiết bị](Hinh/Hinh_4.png)

---

## 🔍 Chi tiết từng bước trong quy trình thiết kế

### 🧩 Bước 1: Xác định yêu cầu và đặc tả hệ thống (vẽ sơ đồ khối)

- Hàm cần hiện thực: **Y = A × X + B**, dùng chuẩn số **fixed point Q15.16** ( 1 bit dấu, 15 bit số nguyên, 16 bit thập phân).
- Xây dựng sơ đồ khối gồm các khối nhân, cộng, thanh ghi và điều khiển bởi **FSM (Finite State Machine)**.
- FSM gồm 3 trạng thái: `IDLE`, `EXECUTE`, `WAIT_DONE`, điều khiển thông qua tín hiệu `Start_in` và `Done_in`.

📌 Tín hiệu chính:  
`A_in`, `X_in`, `B_in` (đầu vào), `Y_out`, `Valid_out` (đầu ra), `Start_in`, `Done_in` (điều khiển)

![Sơ đồ khối](Hinh/Hinh_3.png)

### ⚙️ Bước 2: Mô tả thiết kế phần cứng và mô phỏng chức năng

- Viết mã Verilog mô tả mạch số thực hiện phép tính `Y = A × X + B` với chuẩn **fixed-point Q15.16**.
- Thiết kế bao gồm mạch tổ hợp (nhân, cộng) và điều khiển bởi **FSM** có 3 trạng thái: `IDLE`, `EXECUTE`, `WAIT_DONE`.
- Viết testbench mô phỏng 10 test case với các giá trị thực và kiểm tra đầu ra `Y_out`.
- Chạy mô phỏng bằng **Vivado Simulator**, quan sát tín hiệu trên waveform và kết quả kiểm tra được in ở cửa sổ console.

![Mô phỏng trên Vivado](Hinh/Hinh_4.png)
