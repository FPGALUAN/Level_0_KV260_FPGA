-makelib xcelium_lib/xilinx_vip -sv \
  "/opt/xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "/opt/xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "/opt/xilinx/Vivado/2022.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "/opt/xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "/opt/xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "/opt/xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "/opt/xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "/opt/xilinx/Vivado/2022.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "/opt/xilinx/Vivado/2022.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xpm -sv \
  "/opt/xilinx/Vivado/2022.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/opt/xilinx/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
  "/opt/xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/opt/xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../SoC.gen/sources_1/bd/SoC/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_13 -sv \
  "../../../../SoC.gen/sources_1/bd/SoC/ipshared/ffc2/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/zynq_ultra_ps_e_vip_v1_0_13 -sv \
  "../../../../SoC.gen/sources_1/bd/SoC/ipshared/abef/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_zynq_ultra_ps_e_0_0/sim/SoC_zynq_ultra_ps_e_0_0_vip_wrapper.v" \
  "../../../../SoC.gen/sources_1/bd/SoC/ipshared/739c/RTL/AXI4_Mapping.v" \
  "../../../../SoC.gen/sources_1/bd/SoC/ipshared/739c/RTL/MAC.v" \
  "../../../../SoC.gen/sources_1/bd/SoC/ipshared/739c/RTL/MY_IP.v" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_MY_IP_0_0/sim/SoC_MY_IP_0_0.v" \
-endlib
-makelib xcelium_lib/xlconstant_v1_1_7 \
  "../../../../SoC.gen/sources_1/bd/SoC/ipshared/badb/hdl/xlconstant_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_0/sim/bd_d7be_one_0.v" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../SoC.gen/sources_1/bd/SoC/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../SoC.gen/sources_1/bd/SoC/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_1/sim/bd_d7be_psr_aclk_0.vhd" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../SoC.gen/sources_1/bd/SoC/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_2/sim/bd_d7be_arsw_0.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_3/sim/bd_d7be_rsw_0.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_4/sim/bd_d7be_awsw_0.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_5/sim/bd_d7be_wsw_0.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_6/sim/bd_d7be_bsw_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../SoC.gen/sources_1/bd/SoC/ipshared/be1f/hdl/sc_mmu_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_7/sim/bd_d7be_s00mmu_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../SoC.gen/sources_1/bd/SoC/ipshared/4fd2/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_8/sim/bd_d7be_s00tr_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../SoC.gen/sources_1/bd/SoC/ipshared/637d/hdl/sc_si_converter_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_9/sim/bd_d7be_s00sic_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../SoC.gen/sources_1/bd/SoC/ipshared/f38e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_10/sim/bd_d7be_s00a2s_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../SoC.gen/sources_1/bd/SoC/ipshared/66be/hdl/sc_node_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_11/sim/bd_d7be_sarn_0.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_12/sim/bd_d7be_srn_0.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_13/sim/bd_d7be_sawn_0.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_14/sim/bd_d7be_swn_0.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_15/sim/bd_d7be_sbn_0.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_16/sim/bd_d7be_s01mmu_0.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_17/sim/bd_d7be_s01tr_0.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_18/sim/bd_d7be_s01sic_0.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_19/sim/bd_d7be_s01a2s_0.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_20/sim/bd_d7be_sarn_1.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_21/sim/bd_d7be_srn_1.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_22/sim/bd_d7be_sawn_1.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_23/sim/bd_d7be_swn_1.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_24/sim/bd_d7be_sbn_1.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../SoC.gen/sources_1/bd/SoC/ipshared/9cc5/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_25/sim/bd_d7be_m00s2a_0.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_26/sim/bd_d7be_m00arn_0.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_27/sim/bd_d7be_m00rn_0.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_28/sim/bd_d7be_m00awn_0.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_29/sim/bd_d7be_m00wn_0.sv" \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_30/sim/bd_d7be_m00bn_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../SoC.gen/sources_1/bd/SoC/ipshared/6bba/hdl/sc_exit_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/ip/ip_31/sim/bd_d7be_m00e_0.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/bd_0/sim/bd_d7be.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_27 \
  "../../../../SoC.gen/sources_1/bd/SoC/ipshared/f0b4/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_axi_smc_0/sim/SoC_axi_smc_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../SoC.gen/sources_1/bd/SoC/ip/SoC_rst_ps8_0_99M_0/sim/SoC_rst_ps8_0_99M_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../SoC.gen/sources_1/bd/SoC/sim/SoC.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

