using Microsoft.Extensions.Options;
using MultiTenant.BusinessLayer.Services.Interfaces;
using MultiTenant.Shared.Models;
using TenantContext;

namespace MultiTenant.BusinessLayer.Services;

public class TenantService : ITenantService
{
    private readonly Tenant tenant;

    public TenantService(ITenantContextAccessor tenantContextAccessor, IOptions<List<Tenant>> tenantOptions)
    {
        tenant = tenantOptions.Value.FirstOrDefault(t => t.Name == tenantContextAccessor.TenantContext.Name);
    }

    public Tenant GetCurrent() => tenant;
}
