#第三个存储过程
#保存用户信息和角色关联信息

DROP PROCEDURE if EXISTS insert_user_and_roles;
DELIMITER //
CREATE PROCEDURE insert_user_and_roles(
	OUT userId BIGINT,
	IN userName VARCHAR(50),
	IN userPassword VARCHAR(50),
	IN userEmail VARCHAR(50),
	IN userInfo TEXT,
	IN headImg BLOB,
	OUT createTime DATETIME,
  IN roleIds VARCHAR(200)
)
BEGIN
#设置当前时间
SET createTime = NOW();
#插入数据
INSERT INTO sys_user(user_name,user_password,user_email,user_info,head_img,create_time)
VALUES(userName,userPassword,userEmail,userInfo,headImg,createTime);
#获取自增主键
SELECT LAST_INSERT_ID() INTO userId;
#保存用户和角色关系数据
SET roleIds = CONCAT(',',roleIds,',');
INSERT INTO sys_user_role(user_id,role_id)
SELECT userId,id from sys_role
WHERE INSTR(roleIds,CONCAT(',',id,',')) > 0;
END
//
DELIMITER ;