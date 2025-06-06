package spring.study.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import spring.study.dto.GraphDTO;
import spring.study.entity.User;
import spring.study.service.ArtifactService;
import spring.study.service.TraceGraphService;
import spring.study.service.TraceService;
import spring.study.vo.TraceLinkVO;

@Slf4j
@Controller
public class TraceController {
    @Autowired
    private ArtifactService artifactService;

    @Autowired
    private TraceService traceService;
    @Autowired
    private spring.study.service.TraceGraphService traceGraphService;

    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public String deleteLink(@PathVariable("id") Integer traceLinkId) {
        traceService.deleteById(traceLinkId);
        return "ok";
    }

    /** 更新关系类型 */
    @PostMapping("/update/{id}")
    @ResponseBody
    public String updateLinkType(
            @PathVariable("id") Integer traceLinkId,
            @RequestParam("newType") String newType) {
        traceService.updateRelationshipType(traceLinkId, newType);
        return "ok";
    }


    @GetMapping("/tracelink/graph")
    @ResponseBody
    public GraphDTO getGraphData() {
        return traceGraphService.buildGraph();
    }

    /**
     * handle login business
     * @param traceLinkVO
     * @param model
     * @return
     */
    @PostMapping("/addTraceLink")
    public String addTraceLink(@ModelAttribute("traceLinkVO") TraceLinkVO traceLinkVO, Model model) {
        log.info("addTraceLink===================");
        try {

            traceService.saveTraceLink(traceLinkVO);

            // 设置成功消息
            model.addAttribute("message", "Successfully added trace link");
        } catch (Exception e) {
            // 设置错误消息
            model.addAttribute("message", "Error adding trace link: " + e.getMessage());
        }

        // 重新加载工件数据以刷新页面
        model.addAttribute("sourceArtifacts", artifactService.getAllArtifacts());
        model.addAttribute("targetArtifacts", artifactService.getAllArtifacts());
        model.addAttribute("traceLinkVO", new TraceLinkVO());

        return "tracelink";


    }

    @GetMapping("/addTraceLink")
    public String showAddTraceLinkForm(Model model) {
        log.info("showAddTraceLinkForm===============");

        model.addAttribute("sourceArtifacts", artifactService.getAllArtifacts());
        model.addAttribute("targetArtifacts", artifactService.getAllArtifacts());


        model.addAttribute("traceLinkVO", new TraceLinkVO());

        return "tracelink";
    }


}
