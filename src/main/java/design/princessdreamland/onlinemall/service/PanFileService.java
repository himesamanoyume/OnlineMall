package design.princessdreamland.onlinemall.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import design.princessdreamland.onlinemall.entity.PanFile;

import java.util.List;

public interface PanFileService extends IService<PanFile> {

    List<PanFile> queryList(PanFile postImg);

    IPage<PanFile> queryPage(Page<PanFile> page, PanFile postImg, String keyword);

    PanFile queryById(String postImgId);

    IPage<PanFile> searchPage(String fileName);

    PanFile addPanFile(PanFile postImg);

}
