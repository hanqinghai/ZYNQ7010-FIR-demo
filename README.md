# 在ZYNQ7010上制作可变FIR滤波系数的Demo
在Vivado 2020.2上使用CortexA9控制FIR IP核重装载.coe文件的不同组别滤波系数
使用matlab的fatool工具生成了两组570阶的低通滤波系数                                     
config  |  pass  |  stop                                           
      0    |  20KHz |  30KHz                                                   
      1    |  10KHz |  20KHz                                              
每隔1秒交替切换滤波器系数                                                
![IMG_20250715_182924](https://github.com/user-attachments/assets/760bd6cf-38c9-4817-9487-37614ce5c721)
![IMG_20250715_182952](https://github.com/user-attachments/assets/8a537447-5890-46b9-a22c-f084ac25b762)
![IMG_20250715_182930](https://github.com/user-attachments/assets/2f32f5c1-2cea-4ef0-b4eb-b52fa1fce40c)

