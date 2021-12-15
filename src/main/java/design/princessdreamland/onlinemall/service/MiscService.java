package design.princessdreamland.onlinemall.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import design.princessdreamland.onlinemall.entity.Misc;


import javax.servlet.http.HttpSession;
import java.util.List;

public interface MiscService extends IService<Misc> {

    List<Misc> queryList(Misc misc);

    IPage<Misc> queryPage(Page<Misc> page,Misc misc);

    Misc queryById(String miscId);

}
