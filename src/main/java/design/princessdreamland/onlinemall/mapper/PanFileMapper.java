package design.princessdreamland.onlinemall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import design.princessdreamland.onlinemall.entity.PanFile;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PanFileMapper extends BaseMapper<PanFile> {

    List<PanFile> queryList(@Param("panFile") PanFile panFile);

    IPage<PanFile> queryPage(Page<PanFile> page, @Param("panFile") PanFile panFile, String fileName);

    PanFile queryById(String panFileId);

}
