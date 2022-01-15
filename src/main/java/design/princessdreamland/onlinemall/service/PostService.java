package design.princessdreamland.onlinemall.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import design.princessdreamland.onlinemall.entity.Post;

import javax.servlet.http.HttpSession;

public interface PostService extends IService<Post> {
    IPage<Post> queryPage(Page<Post> page, Post post);

    IPage<Post> searchIndexPage(String keyword, String currentPage,Integer size);

    IPage<Post> searchConsolePage(String type,String keyword, String currentPage,Integer size);

    IPage<Post> searchPage(String type, String keyword, String currentPage,Integer size);

    Post queryById(String postId);

    Post setStatus(String postId);

    Post addPost(Post post);

    Post editPost(Post post);

    Post deletePost(String postId);

}
