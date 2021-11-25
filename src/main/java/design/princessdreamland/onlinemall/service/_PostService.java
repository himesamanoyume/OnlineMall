package design.princessdreamland.onlinemall.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import design.princessdreamland.onlinemall.entity._Post;

public interface _PostService extends IService<_Post> {
    IPage<_Post> queryPage(Page<_Post> page, _Post post);

    IPage<_Post> searchIndexPage(String type ,String currentPage);

    IPage<_Post> searchPage(String type,String keyword, String currentPage);

    _Post queryById(String postId);
}
