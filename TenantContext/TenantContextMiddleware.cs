using Microsoft.AspNetCore.Http;

namespace TenantContext;

internal class TenantContextMiddleware
{
    private readonly RequestDelegate next;
    private readonly ITenantContextAccessor tenantContextAccessor;
    private readonly TenantContextOptions tenantContextOptions;

    public TenantContextMiddleware(RequestDelegate next, ITenantContextAccessor tenantContextAccessor, TenantContextOptions tenantContextOptions)
    {
        this.next = next;
        this.tenantContextAccessor = tenantContextAccessor;
        this.tenantContextOptions = tenantContextOptions;
    }

    public async Task Invoke(HttpContext context)
    {
        tenantContextAccessor.TenantContext = new DefaultTenantContext();

        try
        {
            var host = context.Request.Host.Host;
            var tenant = host?.Split('.').ElementAtOrDefault(0)?.Trim().ToLower();

            if (tenantContextOptions.AvailableTenants.Contains(tenant))
            {
                tenantContextAccessor.TenantContext.Tenant = new(tenant);
                await next(context);
            }
        }
        catch
        {
        }

        context.Response.StatusCode = StatusCodes.Status404NotFound;
    }
}
