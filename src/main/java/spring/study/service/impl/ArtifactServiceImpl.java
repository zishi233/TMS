package spring.study.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring.study.dto.ArtifactDTO;
import spring.study.entity.Artifact;
import spring.study.mapper.ArtifactMapper;
import spring.study.service.ArtifactService;

import java.time.LocalDateTime;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

@Service
public class ArtifactServiceImpl implements ArtifactService {

    @Autowired
    private ArtifactMapper artifactMapper;

    // 用于生成递增编号的计数器（模拟数据库序列）
    private static final AtomicLong REQUIREMENT_COUNTER = new AtomicLong(0);
    private static final AtomicLong CODE_COUNTER = new AtomicLong(0);
    private static final AtomicLong TEST_CASE_COUNTER = new AtomicLong(0);
    private static final AtomicLong DOCUMENT_COUNTER = new AtomicLong(0);

    public String addArtifact(ArtifactDTO artifactDTO, Integer createdBy) {
        try {
            // 验证 type 的合法性
            String type = artifactDTO.getType();
            if (!isValidType(type)) {
                return "Addition failed: Invalid type";
            }

            // 根据 type 生成 name
            String name = generateName(type);

            // 将 DTO 转换为 Artifact
            Artifact artifact = new Artifact();
            artifact.setDescription(artifactDTO.getDescription());
            artifact.setType(type);
            artifact.setName(name);
            artifact.setCreatedBy(createdBy);
            artifact.setCreatedOn(LocalDateTime.now());

            // 插入数据库
            artifactMapper.insert(artifact);
            return "Successfully added";
        } catch (Exception e) {
            return "Fail to Add" + e.getMessage();
        }
    }

    @Override
    public List<Artifact> getAllArtifacts() {
        return artifactMapper.findAll();
    }

    private boolean isValidType(String type) {
        return type != null && (
                type.equals("Requirement") ||
                        type.equals("Code") ||
                        type.equals("Test Case") ||
                        type.equals("Document")
        );
    }

    private String generateName(String type) {
        String prefix;
        AtomicLong counter;
        switch (type) {
            case "Requirement":
                prefix = "req";
                counter = REQUIREMENT_COUNTER;
                break;
            case "Code":
                prefix = "code";
                counter = CODE_COUNTER;
                break;
            case "Test Case":
                prefix = "test";
                counter = TEST_CASE_COUNTER;
                break;
            case "Document":
                prefix = "doc";
                counter = DOCUMENT_COUNTER;
                break;
            default:
                throw new IllegalArgumentException("Invalid type: " + type);
        }
        long count = counter.incrementAndGet();
        return String.format("%s-%02d", prefix, count);
    }
}
