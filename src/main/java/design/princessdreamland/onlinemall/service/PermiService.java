package design.princessdreamland.onlinemall.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import design.princessdreamland.onlinemall.entity.Permi;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface PermiService extends IService<Permi> {

    List<Permi> queryList(Permi permi);

    IPage<Permi> queryPage(Page<Permi> page, Permi permi);

    Permi login(Permi permi, HttpSession session) throws Exception;
}
