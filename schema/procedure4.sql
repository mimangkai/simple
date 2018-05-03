#第四个存储过程
#删除用户信息和角色关联信息
DROP PROCEDURE IF EXISTS delete_user_by_id;
DELIMITER //
CREATE PROCEDURE delete_user_by_id(
	IN userId BIGINT)
BEGIN
DELETE FROM sys_user_role WHERE user_id = userId;
DELETE FROM sys_user WHERE id = userId;
END
//
DELIMITER ;