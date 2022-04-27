using Microsoft.AspNetCore.Mvc;
using TenantContext;

namespace MultiTenant.WebApi.Controllers;

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
        var tenant = tenantContextAccessor.TenantContext.Tenant;
        return Ok(tenant);
    }
}
