using Microsoft.AspNetCore.Mvc;
using TenantContext;

namespace MultiTenant.Controllers;

[ApiController]
[Route("api/[controller]")]
public class TenantController : ControllerBase
{
    private readonly ITenantContextAccessor tenantContextAccessor;

    public TenantController(ITenantContextAccessor tenantContextAccessor)
    {
        this.tenantContextAccessor = tenantContextAccessor;
    }

    [HttpGet]
    public IActionResult Get()
    {
        var tenant = tenantContextAccessor.TenantContext.Name;
        return Ok(new { Name = tenant });
    }
}
