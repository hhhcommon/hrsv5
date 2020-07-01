# 5.0版

### 编码原则
- 整洁
- 代码要：整洁！整洁！整洁！
- 写的代码行数越少越好
- 代码行数越少越好
- 方法注释中，用 " 1. 2. 3. " 写出处理逻辑，并且，方法中每段代码要写上对应的编号

### 测试原则
- 测试代码可以在任何环境下运行（只要修改配置文件即可）
- 在before中构造数据，after中清理数据
- 质量组每天做功能覆盖率检查

### 提交原则


## 代码提交的规则
- 未完成及错误代码 __不要__ 提交。这些代码一定要提交的话，就全部注释掉，再提交。
- 未完成错误代码 __不要__ 提交。这些代码一定要提交的话，就全部注释掉，再提交。
- 每次提交要书写　 __详细__ 说明
- 每次提交要书写 __详细__ 说明
- 对不同的代码要　 __分别__ 编写说明
- 对不同的代码要 __分别__ 编写说明
```text
例如：某次修改了5个java文件，3个是完成同一件事情，2个是完成另外一件事情
那么，本地应该commit 两次，每次commit填写本件事情相关的详细说明
最后，执行一次push操作。 
```  
- 本地建立自己使用的 __.gitignore__ 文件，并且 __永远不要__ 提交这个文件

### 打包发布
- 使用gradle进行打包发布
- 先执行gradle release -x test 项目进行打包
- 再执行gradle moveBranch 会在项目的同级目录下生成app目录
- 目录结构A、B...项目目录,每个项目下包括bin（启动脚本等）、dist（项目jar和resources）、logs（日志目录）、progout（项目输出目录，如上传文件等）
- dbscript：建库脚本目录
- frontend：前端目录，前端需要使用node单独打包拷贝
- lib：项目依赖的所有的jar文件
- Agent：包含agent.jar、hrds_Control.jar、hrds_Trigger.jar

```
|--app                           #根目录
|  |--sub sys name                #包含A、B、C、D、F、G、H、K、Receive
|  |   |--bin                      #启动脚本
|  |   |--dist                     #程序目录
|  |   |   |--xxx.jar               #可运行的jar文件
|  |   |   |--resources             #fdconfig、i18n、log4j2.xml
|  |   |--logs                     #每个项目生成的日志文件目录
|  |   |--progout                  #项目的输出文件目录，如上传文件等
|  |--Agent                       #hrds_Agent.jar、hrds_Control.jar、hrds_Trigger.jar
|  |--dbscript                    #01-create_table.sql ..................sql文件
|  |--frontend                    #前端部署的程序

