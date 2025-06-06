package spring.study.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring.study.entity.TraceLink;
import spring.study.mapper.TraceMapper;
import spring.study.service.TraceService;
import spring.study.vo.TraceLinkVO;

import java.time.LocalDateTime;
import java.util.List;

/**
 * TraceService 接口实现
 */
@Service
public class TraceServiceImpl implements TraceService {

    @Autowired
    private TraceMapper traceMapper;

    @Override
    public void saveTraceLink(TraceLinkVO traceLinkVO) {
        TraceLink t = new TraceLink();
        t.setSourceArtifactId(Integer.valueOf(traceLinkVO.getSourceArtifact()));
        t.setTargetArtifactId(Integer.valueOf(traceLinkVO.getTargetArtifact()));
        t.setRelationshipType(traceLinkVO.getLinkType());
        t.setCreatedOn(LocalDateTime.now());
        traceMapper.insert(t);
    }

    @Override
    public List<TraceLink> findAll() {
        return traceMapper.findAll();
    }

    @Override
    public void deleteById(Integer traceLinkId) {
        traceMapper.deleteById(traceLinkId);
    }

    @Override
    public void updateRelationshipType(Integer traceLinkId, String newType) {
        traceMapper.updateType(traceLinkId, newType);
    }
}
