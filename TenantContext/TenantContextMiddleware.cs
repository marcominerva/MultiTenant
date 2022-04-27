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
            string tenant = null;
            var host = context.Request.Host.Host;

            if (!string.IsNullOrWhiteSpace(host))
            {
                tenant = host.Split('.')[0];
            }

            tenantContextAccessor.TenantContext.Tenant = new Tenant(tenant?.Trim().ToLower());
        }
        catch
        {
        }

        await next(context);
    }
}
