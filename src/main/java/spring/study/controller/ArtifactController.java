package spring.study.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import spring.study.dto.ArtifactDTO;
import spring.study.service.ArtifactService;

@Controller
public class ArtifactController {
    @Autowired
    private ArtifactService artifactService;


    @GetMapping("/artifact/add")
    public String addArtifact(Model model) {
        return "artifact";
    }



    @PostMapping("/artifact/add")
    public String addArtifact(@ModelAttribute ArtifactDTO artifactDTO, Model model) {
        // 获取当前登录用户的 ID（假设 Spring Security 存储的是用户 ID）
//        String userIdStr = SecurityContextHolder.getContext().getAuthentication().getName();
        String userIdStr = "1";
        Integer createdBy;
        try {
            createdBy = Integer.valueOf(userIdStr);
        } catch (NumberFormatException e) {
            model.addAttribute("message", "Addition failed: The current user ID cannot be obtained");
            return "artifact";
        }

        // 调用 Service 层添加 Artifact
        String result = artifactService.addArtifact(artifactDTO, createdBy);

        // 将结果添加到模型，供 Thymeleaf 渲染
        model.addAttribute("message", result);
        return "artifact"; // 返回 Thymeleaf 模板名
    }


}
