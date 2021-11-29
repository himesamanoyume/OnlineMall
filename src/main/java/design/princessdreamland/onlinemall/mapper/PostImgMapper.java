package design.princessdreamland.onlinemall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import design.princessdreamland.onlinemall.entity.PostImg;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PostImgMapper extends BaseMapper<PostImg> {

    List<PostImg> queryList(@Param("postImg") PostImg postImg);

    IPage<PostImg> queryPage(Page<PostImg> page, @Param("postImg")PostImg postImg,String keyword);

    PostImg queryById(String postImgId);

}
