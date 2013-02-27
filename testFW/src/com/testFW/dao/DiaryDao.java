package com.testFW.dao;

import java.util.List;

import com.testFW.bo.DiaryBO;
import com.testFW.bo.UserBO;

/**
 * 日志数据处理接口 
 * @author kalor
 * @time 2013-1-24 at 下午04:15:41
 */
public interface DiaryDao {
	
	/**
	 * 新增日志
	 * @param title 日志标题
	 * @param tags 标签
	 * @param diaryContent 日志内容
	 * @param userId 作者id
	 * @param userName 作者姓名
	 * @return 受影响的行的主键
	 */
	 int insertDiary(String title,String tags,String diaryContent,Long userId,String userName);
	 
	 /**
	  * 插入新回复
	  * @param diaryId 日志id
	  * @param parentId 上级id 0为回复的日志，其余为回复的日志回复
	  * @param reply 回复内容
	  * @param user 用户
	  * @return
	  */
	 int insertReply(String diaryId,String parentId,String reply,UserBO user);
	 
	 /**
	  * 插入新回复
	  * @param diaryId 日志id
	  * @param parentId 上级id 0为回复的日志，其余为回复的日志回复
	  * @param reply 回复内容
	  * @param name 姓名
	  * @param email 邮箱
	  * @param website 网站
	  * @return
	  */
	 int insertReply(String diaryId,String parentId,String reply,String name,String email,String website);
	 
	 /**
	  * 查询日志列表
	  * @param userId 用户id
	  * @param start 开始下标
	  * @param end 结束下标
	  * @return 日志实体类的List
	  */
	 List<DiaryBO> queryDiaryList(Long userId,int start,int end);
	 
	 /**
	  * 查询指定用户的日志总数
	  * @param userId 用户id
	  * @return 日志总数
	  */
	 int queryDiaryNumByUserId(Long userId);
	 
	 /**
	  * 根据日志id获取日志主要信息
	  * @param diaryId 日志id
	  * @return 日志实体类
	  */
	 DiaryBO queryDiaryById(Long diaryId);
}
