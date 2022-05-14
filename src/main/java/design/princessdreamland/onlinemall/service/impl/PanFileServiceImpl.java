package design.princessdreamland.onlinemall.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import design.princessdreamland.onlinemall.entity.PanFile;
import design.princessdreamland.onlinemall.mapper.PanFileMapper;
import design.princessdreamland.onlinemall.service.PanFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class PanFileServiceImpl extends ServiceImpl<PanFileMapper, PanFile>
        implements PanFileService {

    @Autowired
    private HttpSession session;

    @Override
    public List<PanFile> queryList(PanFile file){
        return baseMapper.queryList(file);
    }

    @Override
    public IPage<PanFile> queryPage(Page<PanFile> page, PanFile file, String keyword){
        return baseMapper.queryPage(page,file,keyword);
    }

    @Override
    public PanFile queryById(String fileId){
        return baseMapper.queryById(fileId);
    }

    @Override
    public IPage<PanFile> searchPage(String fileName){
        PanFile file = new PanFile();
        file.setFileName(fileName);

        Page<PanFile> page = new Page<>();
//        page.setCurrent(new Integer(1));
//        page.setSize(30);

        return baseMapper.queryPage(page,file,fileName);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public PanFile addPanFile(PanFile file){
//        postImg.setCreateTime(new Date());
        this.save(file);

        return file;
    }

}
