package spring.study.service;

import spring.study.vo.TraceLinkVO;
import spring.study.entity.TraceLink;

import java.util.List;

/**
 * TraceLink 的 CRUD 业务接口
 */
public interface TraceService {
    /**
     * 保存一条 TraceLink
     * @param traceLinkVO 前端页面传入的 VO
     */
    void saveTraceLink(TraceLinkVO traceLinkVO);

    /**
     * 查询所有 TraceLink（可用于列表展示、可视化等）
     */
    List<TraceLink> findAll();

    void deleteById(Integer traceLinkId);
    void updateRelationshipType(Integer traceLinkId, String newType);
}
