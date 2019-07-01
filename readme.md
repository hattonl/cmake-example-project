# faw_hwio_test

## 说明

本项目为嵌入式硬件接口测试项目，用于验证嵌入式系统硬件通信接口的功能和性能是否正常，如以太网、CAN、串口等。当然在本项目中也包含一些一般性的硬件接口功能测试，如GPIO。

另外，此程序带有一个简单的shell交互界面并基于CMake编译，在编译及应用上都非常简洁。

## 结构

本项目的所有源码都放在`faw_hwio_tester`目录下，并以每个测试对象（如以太网、CAN、串口等）分成了各个独立的子目录。在每个存放源码的目录下都有独立的      `CMakeList.txt`文件。

其他文件说明如下

|    文件    | 说明 |
| ---------- | --- |
|   `CMakeList.txt` |  顶层的`cmake`文件 |
| `build.sh` |  用于交叉编译脚本，执行后编译工具使用交叉编译器进行编译。便器的选择在`toolchain.cmake`中给定。 |
| `build_native.sh` | 用于本地编译的脚本，执行后使用本地编译器工具进行编译。|
| `toolchain.cmake` | 用于交叉编译时指定目标平台和所使用的交叉编译器 |

## 编译

1. 在进行交叉编译时，首先应该确定`toolchain.cmake`文件中所指定的交叉编译工具是否可用，如指定的交叉编译工具没有给出绝对路径或者没有加入到`PATH`中等。
2. 上一步确认完成之后，在本项目的根目录执行`./build.sh`。此时，在shell界面出现系列交互文本，若用者不明其意，全部选择1即可。
3. 上步完成之后，在项目根目录将会出现一个名为`Release`的目录（目录的名字与第2步中对编译选项的选择有关），其下存放着`cmake`所产生的中间文件以及本项目最终的可执行文件。
4. 在本例中可执行文件为`Release/faw_hwio_tester/faw_hwio_test`，将其拷贝到目标嵌入式平台上即可运行。

## 使用

在`faw_hwio_test`的目录下执行`./faw_hwio_test`即可执行本测试程序。首先看到的是测试程序的主菜单，输入相应的字符进入到不同的测试程序中。测试选择中直接按键无需回车，若按回车键程序退出。

```shell
+--------[Main Menu]--------+
| A:           NetWork Test |
| B:           CAN     Test |
| C:           PMIC    Test |
| D:           GPIO    Test |
| E:           CAMERA  Test |
| F:           UART    Test |
+---------------------------+
Select one to test:
```
### NetWork Test

```shell
Select one to test:
+--------------------------[NetWork Test Menu]--------------------------+
| A -  Server/Client  Mode                            : Server          |
| B -  Server port to listen on/connect to            : 4006            |
| C -  Number of parallel client streams to run       : 1               |
| D -  Window Size                                    : 128             |
| E -  Package Size [KB]                              : 128             |
| F -  TCP/UDP                                        : TCP             |
| G -  Time in seconds to transmit for                : 10              |
| H -  Seconds between periodic throughput reports    : 1               |
| I -  Function Mode/ Performance Mode                : Performance     |
| J -  Functional test mode transmit packet times     : 10              |
| K -  Host IP to connect                             : 127.0.0.1       |
|                                                                       |
+-----------------------------------------------------------------------+
     Change which setting?
```

在选项框中，输入相应的字符即可对相应的选项进行修改。`NetWork`的测试模式分为`Client`和`Server`两种。当测试程序运行在`Server`模式时，程序等待`Client`的连接，然后由`Client`发送数据，`Server`接收后进行相应的处理。功能测试主要用于检测网络传输中是否存在错误，性能测试主要用于测试网络带宽。

|        | Server | Client |
| ---------- | --- | --- |
|   Perfirmance |  Server每接收到一次Client请求创建一个线程进行数据的接收，Server接收到数据后丢弃数据不作处理 | Client建立多个线程持续向Server持续发送数据 |
| Function | Server每接收到一次Client请求创建一个线程进行数据的接收，Server接收到对数据进行回传 | Client在Function测试模式下只建立一个线程与Server通信，Client向Server发送一包数据后等待Server发送返回数据。接收到Server返回数据后Client将之与发送数据进行比较来判断传输错误。 |

### CAN Test

```shell
+----------[Can Test Menu]---------+
| D -  Can Device        : can0    |
| M -  Can Test Mode     : Recv    |
|                                  |
+----------------------------------+
     Change which setting?
```
CAN的测试分为CAN的接收测试和CAN的发送测试。CAN的接收测试比较简单，直接选择can设备并选择 `CAN Test Mode`为`Recv`然后按回车键即可。程序将等待并接收来自CAN网络的报文。在接收过程中按`Ctrl+C`结束接收。

```shell
+----------[Can Test Menu]---------+
| D -  Can Device        : can1    |
| M -  Can Test Mode     : Recv    |
|                                  |
+----------------------------------+
     Change which setting?
CAN Test running Recv Mode ...
Runing Start: Ctrl + C to stop ...

  can1  60A   [4]  01 7D 61 10
  can1  60B   [8]  02 4E 73 FF 80 20 01 8E
  can1  60C   [7]  02 84 A3 3A 02 20 E8
  can1  60D   [8]  02 7D 0F A0 70 80 19 05
  can1  60A   [4]  02 7D 63 10
  can1  60B   [8]  02 4E 73 FF 80 20 01 8E
  ...
^C
Test Finished: Input any char to return ...
```
若要进行CAN发送的测试还要进入下一级菜单进行配置。
```shell
+-------------[Can Send Test Menu]------------+
| G -  Gap in milli seconds         : 200     |
| E -  Extended mode CAN frames     : No      |
| F -  Generate CAN FD CAN frames   : No      |
| R -  Send RTR frame               : No      |
| I -  CAN ID generation mode       : r       |
| L -  CAN DLC generation mode      : r       |
| D -  CAN data generation mode     : (below) |
|     r                                       |
+---------------------------------------------+
     Change which setting?
```
各项配置可以参考，cansend程序的配置项。

### PMIC Test

敬请期待...

### GPIO Test

GPIO测试为测试板子上的按键与LED灯是否可以正常工作。当执行GPIO测试时，需要人为按键然后观察板子上的LED的亮灭情况。（注：GPIO测试不具有通用性）

### CAMERA Test

敬请期待...

### UART Test

UART测试为测试串行口收发是否正常。执行UART测试时，应首先在一块板子上执行`UART Test`的`Server`程序，该程序将等待来自`Client`的数据。另一块板子上执行UART Test的`Client`程序，该程序向`Server`发送连续的字节。`Server`接收到来自`Client`的数据后进行字节的校验来判断通信是否正常。`UART Test`的配置内容与普通的串口工具配置内容项基本相同。

```shell
+-----------------[Uart Test Menu]-----------------+
| U -  Serial Device            : /dev/ttyPS1      |
| M -  Server/ Client Mode      : Server           |
| B -  Bitrate                  : 9600             |
| D -  DataBits (5, 6, 7, 8)    : 8                |
| S -  StopBits (1, 2)          : 1                |
| P -  Parity                   : None             |
| C -  Software Flow Control    : None             |
| F -  Hardware Flow Control    : None             |
| R -  Data Show Mode           : None             |
|                                                  |
+--------------------------------------------------+
     Change which setting?
```
