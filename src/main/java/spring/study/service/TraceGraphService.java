package spring.study.service;

import spring.study.dto.GraphDTO;

/**
 * 构建前端可视化所需的 GraphDTO
 */
public interface TraceGraphService {
    /**
     * 构造包含所有 Artifact 节点和 TraceLink 边的 GraphDTO
     */
    GraphDTO buildGraph();
}

