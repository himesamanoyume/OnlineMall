package design.princessdreamland.onlinemall.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import design.princessdreamland.onlinemall.entity.PostImg;

import java.util.List;

public interface PostImgService extends IService<PostImg> {

    List<PostImg> queryList(PostImg postImg);

    IPage<PostImg> queryPage(Page<PostImg> page,PostImg postImg);

    PostImg queryById(String postImgId);

    IPage<PostImg> searchPage(String keyword);

}
