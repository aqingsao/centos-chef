# http://www.hackbase.com/tech/2009-11-08/57765.html

# 修改密码长度：在你安装linux时默认的密码长度是5个字节。但这并不够，要把它设为8。修改最短密码长度需要编辑login.defs文件（vi　/etc/login.defs），把下面这行
PASS_MIN_LEN　　　　5　
改为
PASS_MIN_LEN　　　　8