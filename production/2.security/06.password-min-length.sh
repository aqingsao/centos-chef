# http://www.hackbase.com/tech/2009-11-08/57765.html
# 修改密码长度：默认长度是5个字节，要把它设为8。
vi　/etc/login.defs

PASS_MIN_LEN　　　　5　
改为
PASS_MIN_LEN　　　　8