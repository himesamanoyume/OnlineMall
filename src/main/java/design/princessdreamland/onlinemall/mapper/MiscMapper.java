package design.princessdreamland.onlinemall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import design.princessdreamland.onlinemall.entity.Misc;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MiscMapper extends BaseMapper<Misc> {

    List<Misc> queryList(Misc misc);

    IPage<Misc> queryPage(Page<Misc> page, Misc misc);

    Misc queryById(String miscId);

}
