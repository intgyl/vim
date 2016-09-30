## vim

#### vim plugin
	autoload
	bundle 管理插件，打开vi 输入 :bundleInstall 安装vimrc文件中的插件
	plugin
	snippets
	syntax
	soft_config
	├── iterm2           //mac iterm2 config
	├── stardict         //星际译王词典
	└── ubuntu-tweak     //ubuntu-tweak config

### scripts
	bin
	├── android_tools
	│   ├── common
	│   ├── qcom
	│   └── windows
	├── other
	├── tools
	└── winfonts

	common
	├── adb-connect.sh  //简化adb connect
	├── append2simg
	├── boot2ota.sh
	├── checkfc
	├── check_seapp
	├── cpu_gpu_clk.sh //查看手机cpu gpu 是clock
	├── fastboot
	├── flash.sh       //简化fastboot刷机
	├── ftrace.sh
	├── get_java_xms
	├── img2simg
	├── make_ext4fs
	├── minigzip
	├── mkbootfs
	├── mkbootimg
	├── ota_signer.sh
	├── packimage.sh    //将高通拆分开的img，如syste_01.img 打包成完成img,支持system.img userdata.img cache.img
	├── packramdisk.sh  //打包ramdisk
	├── packsparseimg
	├── sepolicy-analyze
	├── sepolicy-check
	├── signapk.jar
	├── simg2img
	├── touch_phone.sh
	├── unpackbootimg  //解包boot.img
	├── dtc.sh         //反编译dtb
	└── unpackramdisk.sh


	qcom
	├── edl-flash.sh  //linux 刷整包工具
	├── emmcdl
	├── fh_loader
	└── QSaharaServer

	tools
	├── 7z.sh             //打包 解包7z
	├── ast.sh            //格式化代码
	├── astyle_linux      //astyle for linux
	├── astyle_mac        //astyle for mac
	├── com.sh            //minicom 工具，自动保存log到 ~/log/minicom_log 按照日期创建目录，根据时间创建文件
	├── easyssh.sh        //快速登录主机，主机ip存在~/.data_server_bookmark, 将本机id_rsa.pub贴到目标机器的~/.ssh/authorized_keys 文件可实现ssh scp免输密码，反之亦然。
	├── envsetup.sh
	├── gg.sh             //grep 命令的简化，可免除引号，不足：不能搜着指定文件
	├── grep_linux        //grep linux修改版，搜索结果将：换成+ 方便vi 直接打开
	├── grep_mac          //grep mac 修改版
	├── gt.sh             //快速进入指定目录，标签位于~/.data_gtdirs
	├── killpid.sh        //快速杀掉进程，不必先ps 找到进程号再杀
	├── lindent           //格式化代码，kernel scri目录中有该脚本
	├── list_all.sh       //列出当前目录下所有节点的值，格式：node,value方便debug查看所有节点值以及导出到excel中
	├── list_target.sh    //与list_all类似，递归遍历所有目录下指定节点的值。
	├── make_cscope       //生成cscope 和tags
	├── make_lookupfile
	├── make_lookupfile_TAGS
	├── suffix.sh         //批量修改后缀名
	├── tounix.sh         //递归格式化文件类型
	├── urar.sh           //解包 rar
	├── uzip.sh           //解包zip
	└── where_which.sh
