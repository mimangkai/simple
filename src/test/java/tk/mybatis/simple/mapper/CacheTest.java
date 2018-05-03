package tk.mybatis.simple.mapper;

import org.apache.ibatis.session.SqlSession;
import org.junit.Assert;
import org.junit.Test;
import tk.mybatis.simple.model.SysRole;
import tk.mybatis.simple.model.SysUser;

public class CacheTest extends BaseMapperTest{
    @Test
    public void testL1Cache(){
        SqlSession sqlSession = getSqlSession();
        SysUser user1 = null;
        try{
            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
            user1 = userMapper.selectById(1l);
            user1.setUserName("New Name");
            SysUser user2 = userMapper.selectById(1l);
            Assert.assertEquals("New Name",user2.getUserName());
            Assert.assertEquals(user1,user2);
        }finally {
            sqlSession.close();
        }
        System.out.println("开启新的sqlSession");
        sqlSession = getSqlSession();
        try{
            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
            SysUser user2 = userMapper.selectById(1l);
            Assert.assertNotEquals("New Name",user2.getUserName());
            Assert.assertNotEquals(user1,user2);
            userMapper.deleteById(2L);
            SysUser user3 = userMapper.selectById(1L);
            Assert.assertNotEquals(user2,user3);
        }finally {
            sqlSession.close();
        }
    }

    @Test
    public void testL2Cache(){
        SqlSession sqlSession = getSqlSession();
        SysRole role1 = null;
        try{
            RoleMapper roleMapper = sqlSession.getMapper(RoleMapper.class);
            role1 = roleMapper.selectById(1l);
            role1.setRoleName("New Name");
            SysRole role2 = roleMapper.selectById(1L);
            Assert.assertEquals("New Name",role2.getRoleName());
            Assert.assertEquals(role1,role2);
        }finally {
            sqlSession.close();
        }
        System.out.println("开启新的sqlSession");
        sqlSession = getSqlSession();
        try{
            RoleMapper roleMapper = sqlSession.getMapper(RoleMapper.class);
            SysRole role2 = roleMapper.selectById(1l);
            Assert.assertEquals("New Name",role2.getRoleName());
            Assert.assertNotEquals(role1,role2);
            SysRole role3 = roleMapper.selectById(1L);
            Assert.assertNotEquals(role2,role3);
        }finally {
            sqlSession.close();
        }
    }
}
