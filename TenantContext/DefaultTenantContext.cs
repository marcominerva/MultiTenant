namespace TenantContext;

internal class DefaultTenantContext : ITenantContext
{
    public Tenant Tenant { get; set; }

    public DefaultTenantContext()
    {
    }
}
