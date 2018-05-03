DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user(
id BIGINT NOT NULL auto_increment comment '用户ID',
user_name VARCHAR(50) comment '用户名',
user_password VARCHAR(50) comment '密码',
user_email VARCHAR(50) comment '邮箱',
user_info text comment '简介',
head_img blob comment '头像',
create_time datetime comment '创建时间',
PRIMARY KEY (id)
);

ALTER TABLE sys_user comment '用户表';

DROP TABLE IF EXISTS sys_role;
CREATE TABLE sys_role (
id BIGINT NOT NULL auto_increment comment '角色ID',
role_name VARCHAR(50) comment '角色名',
enabled INT comment '有效标志',
create_by BIGINT comment '创建人',
create_time datatime comment '创建时间',
PRIMARY KEY (id)
);
ALTER TABLE sys_role comment '角色表';

DROP TABLE IF EXISTS sys_privilege;
CREATE TABLE sys_privilege(
id BIGINT NOT NULL auto_increment comment '权限ID',
privilege_name VARCHAR(50) comment '权限名称',
privilege_url VARCHAR(200) comment '权限URL',
PRIMARY KEY (id)
);
ALTER TABLE sys_privilege comment '权限表';

DROP TABLE IF EXISTS sys_user_role;
CREATE TABLE sys_user_role(
user_id BIGINT comment '用户ID',
role_id BIGINT comment '角色ID'
);
ALTER TABLE sys_user_role comment '用户角色关联表';

DROP TABLE IF EXISTS sys_role_privilege;
CREATE TABLE sys_role_privilege(
role_id BIGINT comment '角色ID',
privilege_id BIGINT comment '权限ID'
);
ALTER TABLE sys_role_privilege comment '角色权限关联表';

INSERT INTO sys_user VALUES (1,'admin','123456','admin@mybatis.tk','管理员',null,'2018-4-17 19:31:05');
INSERT INTO sys_user VALUES (1001,'test','123456','test@mybatis.tk','测试用户',null,'2018-4-17 19:33:05');

INSERT INTO sys_role VALUES (1,'管理员','1','1','2018-4-17 19:34:12');
INSERT INTO sys_role VALUES (2,'普通用户','1','1','2018-4-17 19:35:10');

INSERT INTO sys_user_role VALUES (1,1);
INSERT INTO sys_user_role VALUES (1,2);
INSERT INTO sys_user_role VALUES (1001,2);

INSERT INTO sys_privilege VALUES (1,'用户管理','/users');
INSERT INTO sys_privilege VALUES (2,'角色管理','/roles');
INSERT INTO sys_privilege VALUES (3,'系统管理','/logs');
INSERT INTO sys_privilege VALUES (4,'人员维护','/persons');
INSERT INTO sys_privilege VALUES (5,'单位维护','/companies');

INSERT INTO sys_role_privilege VALUES (1,1);
INSERT INTO sys_role_privilege VALUES (1,3);
INSERT INTO sys_role_privilege VALUES (1,2);
INSERT INTO sys_role_privilege VALUES (2,4);
INSERT INTO sys_role_privilege VALUES (2,5);