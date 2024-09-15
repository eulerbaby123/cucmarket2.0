# Second-Market
基于python+Django+Mysql的校园二手交易市场

# 运行步骤
需要先安装Python的相关依赖：
Package           Version
----------------- -------
asgiref           3.8.1
Django            3.2.11
mysqlclient       2.2.4
Pillow            9.1.1
pip               24.0
pytz              2024.1
setuptools        69.5.1
sqlparse          0.5.0
typing_extensions 4.12.2
wheel             0.43.0

* 第一步：创建数据库，数据库名：cucmarket
* 第二步：执行SQL语句，打开cucmarket.sql文件，运行该文件中的SQL语句
* 第三步：源码文件为cucmarket.zip，修改源代码中的settings.py文件，改成自己的mysql数据库用户名和密码
* 第四步：运行命令：python manage.py runserver
* 第五步：打开本地浏览器查看

测试账户
* 普通用户：(可以自己注册一个)

* 管理员账户(以下是系统初始管理员，后续可据此创建新的管理员)：
  	用户名：1033220521
  	密码：1234qwer@

进入管理员页面需在URL后面加上/admin，如 http://localhost:8000/admin/

# 系统设计
## 功能设计
### 任务目标
### 功能模块图
## 数据库设计
等 见文档详情