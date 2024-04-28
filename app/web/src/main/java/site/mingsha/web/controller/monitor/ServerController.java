package site.mingsha.web.controller.monitor;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import site.mingsha.common.model.response.AjaxResponseDTO;
import site.mingsha.biz.model.dto.Server;

/**
 * 服务器监控
 * 
 * @author mingsha
 */
@RestController
@RequestMapping("/monitor/server")
public class ServerController
{
    @PreAuthorize("@ss.hasPermi('monitor:server:list')")
    @GetMapping()
    public AjaxResponseDTO getInfo() throws Exception
    {
        Server server = new Server();
        server.copyTo();
        return AjaxResponseDTO.success(server);
    }
}
