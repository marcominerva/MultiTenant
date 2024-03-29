﻿using Microsoft.AspNetCore.Http;

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

        var host = context.Request.Host.Host;
        var tenant = host?.Split('.').ElementAtOrDefault(0)?.Trim().ToLowerInvariant();

        if (tenantContextOptions.AvailableTenants.Contains(tenant))
        {
            tenantContextAccessor.TenantContext.Name = tenant;
            await next(context);
            return;
        }

        context.Response.StatusCode = StatusCodes.Status404NotFound;
    }
}
