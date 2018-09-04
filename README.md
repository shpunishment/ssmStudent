# ssmStudent
### 基于SSM框架的学籍管理系统
前端采用bootstrap完成管理页面布局 <br>
后端采用Spring+SpringMVC+Mybatis+Mysql <br>
分页使用PageHelper的分页插件 <br>

登录使用Ajax进行json交互，登录失败返回“登录失败”信息的json，登录成功返回“下一个路径”的json，用于页面跳转<br>
实现学生管理，对学生单表的增删改查；<br>
实现课程管理，教师表与课程表的两表的增删改查；<br>
实现成绩管理，学生表，成绩表及课程表的三表的增删改查。<br>

## 效果
登录页面 登录失败显示 <br>
<img src="https://github.com/shpunishment/ssmStudent/blob/master/src/main/resources/image/%E7%99%BB%E5%BD%95%E5%A4%B1%E8%B4%A5.PNG"  />

学生管理页面 <br>
<img src="https://github.com/shpunishment/ssmStudent/blob/master/src/main/resources/image/%E5%AD%A6%E7%94%9F%E7%AE%A1%E7%90%86.PNG" />

添加弹出模态框 <br>
<img src="https://github.com/shpunishment/ssmStudent/blob/master/src/main/resources/image/%E6%B7%BB%E5%8A%A0.PNG"/>

修改弹出模态框，并且数据自动填入 <br>
<img src="https://github.com/shpunishment/ssmStudent/blob/master/src/main/resources/image/%E4%BF%AE%E6%94%B9.PNG" />
 
查询返回查询页面<br> 
<img src="https://github.com/shpunishment/ssmStudent/blob/master/src/main/resources/image/%E6%9F%A5%E8%AF%A2.PNG"  />

课程管理 <br>
<img src="https://github.com/shpunishment/ssmStudent/blob/master/src/main/resources/image/%E8%AF%BE%E7%A8%8B%E7%AE%A1%E7%90%86.PNG"  />

成绩管理 <br>
<img src="https://github.com/shpunishment/ssmStudent/blob/master/src/main/resources/image/%E6%88%90%E7%BB%A9%E7%AE%A1%E7%90%86.PNG"  />
