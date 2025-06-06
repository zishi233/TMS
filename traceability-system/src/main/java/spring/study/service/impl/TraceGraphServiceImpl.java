package spring.study.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring.study.dto.GraphDTO;
import spring.study.entity.Artifact;
import spring.study.entity.TraceLink;
import spring.study.mapper.ArtifactMapper;
import spring.study.mapper.TraceMapper;
import spring.study.service.TraceGraphService;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class TraceGraphServiceImpl implements TraceGraphService {

    @Autowired
    private ArtifactMapper artifactMapper;

    @Autowired
    private TraceMapper traceMapper;

    @Override
    public GraphDTO buildGraph() {
        // 1. 拿所有 Artifact
        List<Artifact> artifacts = artifactMapper.findAll();
        // 2. 拿所有 TraceLink
        List<TraceLink> links = traceMapper.findAll();

        // 3. 构造节点列表
        List<GraphDTO.Node> nodes = artifacts.stream().map(a -> {
            GraphDTO.Node n = new GraphDTO.Node();
            // 先把 ID 格式化成两位数
            String num = String.format("%02d", a.getArtifactId());
            n.setId("A" + a.getArtifactId());
            // 再根据类型映射前缀
            String prefix;
            switch (a.getType().toLowerCase()) {
                case "requirement":
                    prefix = "req";
                    break;
                case "test case":
                    prefix = "tc";
                    break;
                case "document":
                    prefix = "doc";
                    break;
                default:
                    // 如果你还有其它类型，就在这里加
                    prefix = a.getType().substring(0, 3).toLowerCase();
            }
            n.setLabel(a.getName());
            return n;
        }).collect(Collectors.toList());

        // 4. 构造边列表
        List<GraphDTO.Edge> edges = links.stream().map(l -> {
            GraphDTO.Edge e = new GraphDTO.Edge();
            e.setId("T" + l.getTraceLinkId());
            e.setSource("A" + l.getSourceArtifactId());
            e.setTarget("A" + l.getTargetArtifactId());
            e.setLabel(l.getRelationshipType());
            e.setCreatedOn(l.getCreatedOn().toString()); // 假设 Edge DTO 有此字段
            return e;
        }).collect(Collectors.toList());

        // 5. 打包返回
        GraphDTO dto = new GraphDTO();
        dto.setNodes(nodes);
        dto.setEdges(edges);
        return dto;
    }
}
