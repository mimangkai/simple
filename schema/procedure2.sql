#第二个存储过程
#简单根据用户和分页参数进行查询,返回总数和分页数据
DROP PROCEDURE if EXISTS select_user_page;
DELIMITER //
CREATE PROCEDURE select_user_page(
	IN userName VARCHAR(50),
	IN _offset BIGINT,
	IN _limit BIGINT,
	OUT total BIGINT)
BEGIN
#查询数据总数
SELECT COUNT(*) INTO total
FROM sys_user
WHERE user_name LIKE CONCAT('%',userName,'%');
#分页查询数据
SELECT *
FROM sys_user
WHERE user_name LIKE CONCAT('%',userName,'%')
LIMIT _offset, _limit;
END
//
DELIMITER ;