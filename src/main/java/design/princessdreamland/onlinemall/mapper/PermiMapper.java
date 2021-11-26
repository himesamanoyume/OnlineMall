package design.princessdreamland.onlinemall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import design.princessdreamland.onlinemall.entity.Permi;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PermiMapper extends BaseMapper<Permi> {

    List<Permi> queryList(Permi permi);

    IPage<Permi> queryPage(Page<Permi> page, Permi permi);

}
