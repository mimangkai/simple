#第一个存储
#根据用户id查询用户其他信息
#方法看起来很奇怪,但是展示了多个输出参数
DROP PROCEDURE IF EXISTS select_user_by_id;
DELIMITER //
CREATE PROCEDURE select_user_by_id(
  IN userId BIGINT,
  OUT userName VARCHAR(50),
	OUT userPassword VARCHAR(50),
	OUT userEmail VARCHAR(50),
	OUT userInfo TEXT,
	OUT headImg BLOB,
	OUT createTime DATETIME)
BEGIN
# 根据用户id查询其他数据
SELECT user_name,user_password,user_email,user_info,head_img,create_time
INTO userName,userPassword,userEmail,userInfo,headImg,createTime
FROM sys_user
WHERE id = userId;
END //
DELIMITER ;