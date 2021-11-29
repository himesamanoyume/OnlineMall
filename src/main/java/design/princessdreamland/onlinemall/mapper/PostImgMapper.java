package design.princessdreamland.onlinemall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import design.princessdreamland.onlinemall.entity.PostImg;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PostImgMapper extends BaseMapper<PostImg> {

    IPage<PostImg> queryPage(Page<PostImg> page, @Param("postImg")PostImg postImg);

    PostImg queryById(String postImgId);

}
