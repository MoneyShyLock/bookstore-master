package com.bookstore.dao;

import com.bookstore.pojo.po.Ask;
import com.bookstore.pojo.po.AskExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AskMapper {
    int countByExample(AskExample example);

    int deleteByExample(AskExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Ask record);

    int insertSelective(Ask record);

    List<Ask> selectByExampleWithBLOBs(AskExample example);

    List<Ask> selectByExample(AskExample example);

    Ask selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Ask record, @Param("example") AskExample example);

    int updateByExampleWithBLOBs(@Param("record") Ask record, @Param("example") AskExample example);

    int updateByExample(@Param("record") Ask record, @Param("example") AskExample example);

    int updateByPrimaryKeySelective(Ask record);

    int updateByPrimaryKeyWithBLOBs(Ask record);

    int updateByPrimaryKey(Ask record);
}